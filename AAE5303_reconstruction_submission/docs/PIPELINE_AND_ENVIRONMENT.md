# Pipeline and Environment Notes

## Pipeline used in this project

```text
ROS bag -> image extraction -> COLMAP sparse reconstruction -> OpenSplat -> .ply output
```

## Extraction notes

Confirmed usable image topic:

```text
/left_camera/image/compressed
```

Typical extraction workflow:

1. Start the ROS1 Docker container
2. Start `roscore`
3. Run the image extraction node
4. Play the bag file
5. Save extracted images directly into the Windows project folder

## Extraction settings used in practice

### `amtown02_small`
- sparse extraction rate
- approximately 126 images kept for the final workflow

### `amtown02_try`
Two versions existed:

#### Older large version
- around 700 images
- useful for testing COLMAP at a larger scale
- too heavy for stable OpenSplat runs in the current setup

#### Current reduced version
- re-extracted at a lower density
- 301 images
- used as the practical experimental branch

## COLMAP workflow

The three main COLMAP stages were:

1. `feature_extractor`
2. `sequential_matcher`
3. `mapper`

Typical Windows PowerShell pattern:

```powershell
E:\COLMAP\COLMAP feature_extractor --database_path "...database.db" --image_path "...images" --ImageReader.single_camera 1 --FeatureExtraction.use_gpu 1
E:\COLMAP\COLMAP sequential_matcher --database_path "...database.db" --FeatureMatching.use_gpu 1
E:\COLMAP\COLMAP mapper --database_path "...database.db" --image_path "...images" --output_path "...sparse"
```

## How mapper results were interpreted

A key point in this project was correctly reading `num_reg_frames`.

- `num_reg_frames = 699` means the ~700-image branch registered successfully
- `num_reg_frames = 300` means the 301-image branch registered successfully

This is because COLMAP reports the frame count with zero-based indexing.

## OpenSplat settings

### Meaning of `d`
- `d=1`: original resolution training, slower and heavier, potentially better quality
- `d=2`: downsampled training, faster and lighter

### Practical outcome in this project
- `amtown02_small`: both `d=1` and `d=2` were successful at high step counts
- `amtown02_try`: `d=2` was the practical stable setting, with best stable confirmation around `n=3000`

## GPU confirmation

The GPU route was not assumed; it was checked explicitly.

Observed signs of a real GPU run:
- `nvidia-smi` showed the `/opensplat` process
- GPU utilization was high during training
- VRAM usage was consistent with an actual run
