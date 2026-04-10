# Experiment Log

## Branch A: `amtown02_small`

This branch became the stable baseline.

### Key points
- complete end-to-end pipeline worked
- COLMAP sparse reconstruction completed
- OpenSplat GPU training was stable
- high-step outputs were successfully produced

### Confirmed successful runs
- `d=1, n=100000`
- `d=2, n=100000`

### Why this branch matters
It proves that the project pipeline itself is valid and reproducible under a manageable scene size.

---

## Branch B: `amtown02_try`

This branch was used as a larger and more demanding test branch.

### Earlier large version
- around 700 images
- COLMAP succeeded
- mapper showed `num_reg_frames = 699`
- OpenSplat became unstable due to current system resource limits

### Reduced version
- re-extracted to 301 images
- COLMAP succeeded again
- mapper showed `num_reg_frames = 300`
- OpenSplat stable result confirmed at `d=2, n=3000`

### Stability boundary observed
- `n=1000`: successful
- `n=2000`: successful
- `n=3000`: successful
- `n=4000+`: unreliable
- `n=5000`: unreliable

### Main interpretation
The practical limit in this branch came from available WSL/Docker resources, not from a basic failure in the reconstruction pipeline.

---

## Final takeaway

The two branches serve different purposes:

- `amtown02_small`: stable proof-of-pipeline branch
- `amtown02_try`: resource-bound experimental branch

This distinction is important because it explains why the repo contains both a polished baseline and a more limited test branch.
