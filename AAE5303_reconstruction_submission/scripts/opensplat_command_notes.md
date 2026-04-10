# OpenSplat Command Notes

This file is a lightweight record of how to think about the OpenSplat stage for this project.

## General ideas

- `d=1` means original resolution
- `d=2` means downsampled training
- larger scenes and larger step counts increase pressure on local resources

## Practical conclusions from this project

### `amtown02_small`
- stable at high step counts
- useful as the final proof-of-pipeline branch

### `amtown02_try`
- reduced branch with 301 images was stable at `d=2, n=3000`
- `n=4000+` was not reliable in the current WSL/Docker setup

