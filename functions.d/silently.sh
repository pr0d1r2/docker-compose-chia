function silently() {
  local silently_STATUS
  local silently_LOG
  silently_LOG="/tmp/.silently-$$-$(echo "$@" | md5sum | cut -f 1 -d ' ').log"
  $@ &> "$silently_LOG"
  silently_STATUS=$?
  if [ $silently_STATUS -gt 0 ]
  then
    cat "$silently_LOG"
  fi
  rm -f "$silently_LOG"
  return $silently_STATUS
}
