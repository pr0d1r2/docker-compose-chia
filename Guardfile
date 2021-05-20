guard :shell do
  watch('Dockerfile') do
    `bash build.sh`
  end

  watch('build.sh') do
    `bash build.sh`
  end

  watch('docker-compose.yml') do
    `bash validate_config.sh`
  end

  watch('validate_config.sh') do
    `bash validate_config.sh`
  end
end
