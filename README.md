# Moving Object Detection, Segmentation & Tracking

**Classical computer vision pipeline for detecting, segmenting, and tracking moving objects across video frames using computational geometry and Kalman-filter-based motion estimation.**

This project implements a MATLAB-based video-processing pipeline that extracts moving foreground objects and constructs an interpretable geometric representation of their shape over time.

The original segmentation and frame-wise object-analysis approach was later extended and refined in my M.Sc. research on temporal single and multiple moving-object recognition.

---

## Technical Approach

The original video-processing pipeline follows:

```text
Input Video
    ↓
Grayscale Conversion
    ↓
Foreground / Frame Difference
    ↓
Binary Foreground Mask
    ↓
Morphological Filtering
    ↓
Canny Edge Detection
    ↓
Boundary & Corner Extraction
    ↓
Centroid Estimation
    ↓
Seed Point Construction
    ↓
Delaunay Triangulation
    ↓
Geometric Object Segmentation
    ↓
Frame-wise Object Analysis
    ↓
Annotated Output Video
```

The approach combines classical computer vision and computational geometry to represent moving foreground objects without relying on neural-network-based detection.

---

## Kalman Filter Tracking Extension

A **constant-velocity Kalman filter tracking component** has been implemented to extend the frame-wise segmentation approach with motion-based centroid estimation.

The tracker is designed to:

- initialize from a detected object centroid
- predict the object's position across subsequent frames
- correct the predicted state using new centroid measurements
- continue estimating object position when a measurement is temporarily unavailable
- reduce sensitivity to noisy centroid measurements

Implementation:

[`experimental/update_kalman_tracker.m`](experimental/update_kalman_tracker.m)

The tracking module is designed to consume centroid measurements produced by the segmentation pipeline.

```text
Video Frame
    ↓
Foreground Detection
    ↓
Object Segmentation
    ↓
Centroid Measurement
    ↓
Kalman Filter
    ├── State Prediction
    └── Measurement Correction
    ↓
Tracked Object Position
```

The Kalman filter introduces a motion model on top of the frame-wise centroid measurements, enabling object-position prediction and correction across successive frames.

---

## Key Techniques

- Moving foreground extraction
- Morphological image filtering
- Canny edge detection
- Boundary and corner extraction
- Centroid estimation
- Delaunay triangulation
- Geometric object segmentation
- Frame-wise video analysis
- Constant-velocity Kalman filtering
- Centroid-based object tracking
- Motion prediction and measurement correction

---

## Demo

[View Segmentation Demo](assets/demo/segmented-output.mp4)

The demo shows moving-object segmentation and geometric representation across successive video frames.

> The available demo represents the original segmentation pipeline. The Kalman tracking component is implemented separately in the experimental module.

---

## Repository Structure

```text
.
├── assets/
│   ├── demo/
│   │   └── segmented-output.mp4
│   └── input/
│       └── sample.mp4
│
├── src/
│   └── adaptive_object_segmentation.m
│
├── experimental/
│   ├── update_kalman_tracker.m
│   └── README.md
│
├── LICENSE
└── README.md
```

---

## Implementation

The project is implemented in **MATLAB** and focuses on classical computer vision, computational geometry, and motion-based tracking.

The original segmentation implementation is available in:

[`src/adaptive_object_segmentation.m`](src/adaptive_object_segmentation.m)

The Kalman tracking component is available in:

[`experimental/update_kalman_tracker.m`](experimental/update_kalman_tracker.m)

---

## Research Progression

This project represents an earlier stage of my work on geometric moving-object analysis.

The segmentation and frame-wise object representation developed here were later extended into my M.Sc. research on **temporal single and multiple moving-object recognition using 4D shape descriptors and descriptive proximity**.

[View M.Sc. Research Repository](https://github.com/javeriaz15/temporal-moving-object-recognition)

---

## Technical Areas

`Computer Vision` · `Object Detection` · `Object Segmentation` · `Object Tracking` · `Kalman Filtering` · `Video Processing` · `Computational Geometry` · `Delaunay Triangulation` · `MATLAB`
