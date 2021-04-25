guard :shell do
  watch('Dockerfile') do
    `bash build.sh`
  end

  watch('build.sh') do
    `bash build.sh`
  end
end
