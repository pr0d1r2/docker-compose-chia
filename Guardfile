guard :shell do
  %w[
    Dockerfile
    build.sh
  ].each do |file|
    watch(file) { `bash build.sh` }
  end

  %w[
    docker-compose.yml
    validate_config.sh
  ].each do |file|
    watch(file) { `bash validate_config.sh` }
  end
end
