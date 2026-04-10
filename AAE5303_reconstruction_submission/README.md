# 3D Scene Reconstruction for AAE5303

This repository documents my **3D scene reconstruction** work for the AAE5303 project.  
My role in the group was the reconstruction pipeline rather than the Visual SLAM leaderboard part.

## What this repository contains

This repo is designed as a **clean personal submission repository** for GitHub.  
It focuses on:

- the reconstruction workflow I actually used
- the difference between the stable `amtown02_small` branch and the experimental `amtown02_try` branch
- the main engineering decisions I made
- the results that were reproduced successfully
- the limitations I found during testing under my current WSL/Docker resources

## My pipeline

```text
ROS bag -> image extraction -> COLMAP sparse reconstruction -> OpenSplat -> .ply output
```

## Input data

- Original bag file: `C:\Users\SOZHAA\Downloads\AMtown02.bag`
- Common mounted path in container: `/data/AMtown02.bag`
- Confirmed image topic for extraction: `/left_camera/image/compressed`

## Environment

The workflow was tested in **WSL + Docker**.

Main images/containers used during the project:

- `liangyu99/orbslam3_ros1:latest` for ROS1 playback and image extraction
- `liangyu99/opensplat-cpu:latest` for early CPU validation
- `opensplat:gpu` for the final GPU-based OpenSplat workflow

The GPU route was confirmed to be real and usable on an **RTX 4060**.  
During OpenSplat runs, `nvidia-smi` showed the `/opensplat` process, high GPU utilization, and expected VRAM usage.

## Reconstruction branches

### 1. Stable branch: `amtown02_small`

Project directory:

```text
E:\amtown02_small
```

This is the most mature reconstruction branch.

Main facts:

- Images extracted at a relatively sparse rate
- Final image count was about **126**
- COLMAP completed successfully
- Sparse reconstruction output was generated correctly
- OpenSplat GPU training was stable
- Confirmed successful high-step runs include:
  - `d=1, n=100000`
  - `d=2, n=100000`

This branch is the strongest evidence that the full pipeline works end to end.

### 2. Experimental branch: `amtown02_try`

Project directory:

```text
E:\amtown02_try
```

This branch is the **testing branch** used to explore a larger and more difficult scene setting.  
Earlier notes may refer to `amtown02_final`; the current naming for this experimental branch is **`amtown02_try`**.

Two versions were tested here:

#### Earlier larger version
- about **700 images**
- COLMAP completed successfully
- mapper output `num_reg_frames = 699`, which means full registration of the image set because the counter is zero-based
- OpenSplat was unstable under the current WSL/Docker resource limits

#### Current reduced version
- images were re-extracted using a lower density
- current image count is **301**
- COLMAP again completed successfully
- mapper output `num_reg_frames = 300`, which means all **301** images were registered
- OpenSplat was stable up to roughly **`d=2, n=3000`**
- runs at `n=4000+` were not reliable in the current setup


## Main results

### `amtown02_small`
- complete pipeline works
- sparse reconstruction successful
- GPU training stable
- `d=1, n=100000` successful
- `d=2, n=100000` successful

### `amtown02_try`
- larger version: COLMAP successful, OpenSplat unstable
- reduced 301-image version: COLMAP successful
- stable OpenSplat result confirmed at `d=2, n=3000`
- current limitation appears at higher training steps because of WSL/Docker resource pressure

A more structured summary is available in [`results/RESULT_SUMMARY.md`](results/RESULT_SUMMARY.md).

## Repository layout

```text
.
├── README.md
├── assets/
├── docs/
├── results/
└── scripts/
```

### Folders

- `assets/`  
  Place screenshots here for your GitHub presentation page  
  Recommended examples:
  - image extraction screenshot
  - COLMAP sparse model screenshot
  - `nvidia-smi` during OpenSplat
  - point cloud screenshot from `amtown02_small`
  - point cloud screenshot from `amtown02_try`

- `docs/`  
  Detailed notes for method, environment, experiment logic, and repo maintenance

- `results/`  
  Result summaries, limitations, and machine-readable metadata

- `scripts/`  
  Example commands and reusable command templates


## Known limitations

The main bottleneck in the experimental branch was **system resources**, not a failure of the reconstruction logic itself.

Observed limitations:

- WSL/Docker memory pressure on larger scenes
- unstable OpenSplat behavior when the image set is too large
- unstable behavior at higher training steps in the `amtown02_try` branch

A fuller note is available in [`results/KNOWN_LIMITATIONS.md`](results/KNOWN_LIMITATIONS.md).

## Reproducibility

Example command templates are provided in:

- [`scripts/colmap_commands_windows_powershell.ps1`](scripts/colmap_commands_windows_powershell.ps1)
- [`scripts/opensplat_command_notes.md`](scripts/opensplat_command_notes.md)

