# Experimental Kalman Tracking Extension

This folder contains exploratory work for extending the original moving-object segmentation pipeline with **Kalman-filter-based centroid tracking**.

The tracker is designed to estimate the position of a moving object across video frames using a **constant-velocity motion model**.

## Purpose

The original segmentation pipeline detects and analyzes moving objects frame by frame.

This experimental extension adds a Kalman filter that can:

- initialize from a detected object centroid
- predict the object's next position
- correct the prediction using a new centroid measurement
- maintain an estimated position when a detection is temporarily unavailable
- reduce the effect of noisy centroid measurements

## Tracking Workflow

```text
Measured Object Centroid
        ↓
Kalman Filter Initialization
        ↓
State Prediction
        ↓
New Centroid Measurement Available?
        ├── Yes → Correct Prediction
        └── No  → Use Predicted Position
        ↓
Estimated / Tracked Centroid
