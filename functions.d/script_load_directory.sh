function script_load_directory() {
  for FILE in $1/*.sh
  do
    # shellcheck disable=SC1090
    source "$FILE"
  done
}
