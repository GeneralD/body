# Print document's middle. (usage: body [START],[END] [FILE])

body() {
	if [[ $# -eq 0 || "$1" == "-h" || "$1" == "--help" ]]; then
		cat << EOF
usage: $0 [START],[END] [FILE]
Output FILE from START to END line.
If START isn't specified, read FILE from the first line.
If END isn't specified, read FILE to the last line.
EOF
		return
	fi
	local exp=$1
	shift
	exp=$(echo $exp | sed -e 's/^,/1,/' -e 's/,$/,$/')
	sed -n -e "${exp}p" $@
}
