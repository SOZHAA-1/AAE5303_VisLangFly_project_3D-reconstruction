# GitHub Update Guide

This repository is structured for a **personal GitHub submission page**.

## Best way to use it

Upload these files to the **root of your personal repository**:

- `README.md`
- `assets/`
- `docs/`
- `results/`
- `scripts/`

## Recommended improvements before final submission

### 1. Add screenshots to `assets/`
Recommended filenames:
- `bag_extraction.png`
- `colmap_sparse_view.png`
- `nvidia_smi_opensplat.png`
- `amtown02_small_result.png`
- `amtown02_try_result.png`

### 2. Update image links in `README.md`
Once screenshots are uploaded, insert them under the relevant sections.

### 3. Keep large outputs off GitHub
Avoid uploading:
- `.ply`
- `.db`
- COLMAP `.bin`
- Docker data

Unless you are using Git LFS, these files make the repo heavy and harder to review.

### 4. Keep wording consistent
Use:
- `amtown02_small` for the stable branch
- `amtown02_try` for the experimental branch

Do not mix the current repo text with the older `amtown02_final` name unless you are explicitly explaining the rename.

## Good commit message examples

- `Add reconstruction submission repo structure`
- `Update README and experiment summary`
- `Add screenshots for reconstruction results`
