# Known Limitations

## 1. Resource ceiling in WSL/Docker

The main limitation in this project was not the basic logic of the pipeline, but the available system resources during larger OpenSplat runs.

Observed issues:
- `Killed` during loading or training
- unstable container behavior
- unstable runs when image count and training steps were both large

## 2. Larger branch is not invalid, but heavier

The earlier larger `amtown02_try` setup still completed COLMAP successfully.  
The issue appeared later, during OpenSplat, which means the reconstruction pipeline itself was still valid up to the sparse stage.

## 3. Stable result does not mean unlimited scaling

The stable `amtown02_small` branch confirms the pipeline works.  
However, that success does not automatically guarantee that a larger scene will remain stable under the same local resource conditions.

## 4. GitHub should not be used as raw artifact storage

A good GitHub submission page should document:
- method
- reasoning
- result summary
- screenshots
- command templates

It should not become a dump of all large intermediate artifacts.
