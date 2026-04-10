# Example COLMAP commands for Windows PowerShell
# Update the paths before running.

E:\COLMAP\COLMAP feature_extractor `
  --database_path "E:\amtown02_try\database.db" `
  --image_path "E:\amtown02_try\images" `
  --ImageReader.single_camera 1 `
  --FeatureExtraction.use_gpu 1

E:\COLMAP\COLMAP sequential_matcher `
  --database_path "E:\amtown02_try\database.db" `
  --FeatureMatching.use_gpu 1

E:\COLMAP\COLMAP mapper `
  --database_path "E:\amtown02_try\database.db" `
  --image_path "E:\amtown02_try\images" `
  --output_path "E:\amtown02_try\sparse"
