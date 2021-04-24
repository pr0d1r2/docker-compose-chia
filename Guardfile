guard :shell do
  watch('Dockerfile') do
    `sh build.sh`
  end

  watch('build.sh') do
    `sh build.sh`
  end
end
