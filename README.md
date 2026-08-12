# Moving Object Detection, Segmentation & Frame-wise Tracking

**Classical computer vision pipeline for detecting, segmenting, and following moving objects across video frames using computational geometry.**

This project implements a MATLAB-based video-processing pipeline that extracts moving foreground objects and constructs an interpretable geometric representation of their shape over time.

The work served as an earlier segmentation and frame-wise object-analysis approach that was later extended and refined in my M.Sc. research on temporal single and multiple moving-object recognition.

---

## Technical Approach

The pipeline processes video frames through:

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
