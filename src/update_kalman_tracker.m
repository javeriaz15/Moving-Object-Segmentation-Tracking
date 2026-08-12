function [kalmanFilter, isInitialized, trackedCentroid, trackingStatus] = ...
    update_kalman_tracker(kalmanFilter, isInitialized, measuredCentroid)
%UPDATE_KALMAN_TRACKER Track a 2-D object centroid with a Kalman filter.
%
% Inputs:
%   kalmanFilter    - vision.KalmanFilter object or []
%   isInitialized   - true after the first valid detection
%   measuredCentroid- [x y] centroid from object segmentation, or []
%
% Outputs:
%   kalmanFilter    - updated Kalman filter
%   isInitialized   - tracker initialization state
%   trackedCentroid - filtered/predicted [x y] location
%   trackingStatus  - "Initialized", "Corrected", "Predicted", or "Waiting"

trackedCentroid = [];
trackingStatus = "Waiting";

if ~isInitialized
    % Initialize only after the first valid centroid measurement.
    if ~isempty(measuredCentroid)

        % Constant-velocity motion model.
        %
        % InitialEstimateError:
        %   [location variance, velocity variance]
        %
        % MotionNoise:
        %   [location variance, velocity variance]
        %
        % MeasurementNoise:
        %   variance of centroid measurement error
        measurementNoise = 25;   % ~5-pixel measurement uncertainty squared

        kalmanFilter = configureKalmanFilter( ...
            'ConstantVelocity', ...
            measuredCentroid, ...
            [measurementNoise, 1e4], ...
            [25, 10], ...
            measurementNoise);

        isInitialized = true;
        trackedCentroid = measuredCentroid;
        trackingStatus = "Initialized";
    end

    return;
end

% Tracker has already been initialized.
if ~isempty(measuredCentroid)

    % Predict current location from previous motion state.
    predict(kalmanFilter);

    % Correct prediction using the newly measured centroid.
    trackedCentroid = correct(kalmanFilter, measuredCentroid);

    trackingStatus = "Corrected";

else

    % Segmentation did not produce a measurement.
    % Continue tracking using the motion model alone.
    trackedCentroid = predict(kalmanFilter);

    trackingStatus = "Predicted";
end

end
