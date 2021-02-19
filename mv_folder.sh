cd $1

dir_count=0
video_count=0
exception_count=0

for f in *;

do filename="$f";

if [[ -d $f ]]; then
	echo "$f: This is a directory so do nothing."
	((++dir_count))
	echo "$dir_count - $f" >> directorylist.txt

else if [[ -f $f ]]; then
	echo "$f: this is a file so we can process this further."
	if [[ $f == *.avi ]]; then
		echo "$f: this is an AVI file."

		avi_filename="$(basename "$f" .avi)"

		echo "file name without extension becomes $avi_filename."

		dir_name="$avi_filename"

		mkdir "$dir_name"

		mv "$f" "$dir_name"/

		((++video_count))
		echo "$video_count - $f" >> filelist.txt


	else if [[ $f == *.mp4 ]]; then
		echo "$f: this is an MP4 file."

		mp4_filename="$(basename "$f" .mp4)"

		echo "file name without extension becomes $mp4_filename."

		dir_name="$mp4_filename"

		mkdir "$dir_name"

		mv "$f" "$dir_name"/

		((++video_count))
		echo "$video_count - $f" >> filelist.txt
	else

		((++exception_count))
		echo "xx $exception_count - $f" >> exceptionlist.txt

	fi
	fi
	
fi
fi
