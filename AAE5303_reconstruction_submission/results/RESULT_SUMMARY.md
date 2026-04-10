# Result Summary

## Overview Table

| Branch | Approx. Images | COLMAP Status | OpenSplat Status | Best Confirmed Stable Result | Role |
|---|---:|---|---|---|---|
| `amtown02_small` | 126 | Successful | Stable | `d=1, n=100000` and `d=2, n=100000` | stable baseline |
| `amtown02_try` (older large version) | ~700 | Successful | Unstable in current setup | not stable enough for final use | large-scale stress test |
| `amtown02_try` (current reduced version) | 301 | Successful | Partially stable | `d=2, n=3000` | experimental test branch |

## Important interpretation notes

### COLMAP registration count
- `num_reg_frames = 699` means full registration for the ~700-image version
- `num_reg_frames = 300` means full registration for the 301-image version

### Stable branch conclusion
`amtown02_small` is the strongest final evidence for the full working pipeline.

### Experimental branch conclusion
`amtown02_try` is useful for demonstrating resource limitations and practical trade-offs in a larger scene setup.

## Best report-facing message

A concise way to describe the outcome is:

> The `amtown02_small` branch fully validated the reconstruction pipeline and remained stable at high OpenSplat training steps, while the `amtown02_try` branch demonstrated the practical resource limits of larger-scale reconstruction under the current WSL/Docker setup.
