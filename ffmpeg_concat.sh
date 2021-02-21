# Concat multiple videos into one clip
# Run `./ffmpeg_concat.sh <directory_of_videos>`
# Make sure files are of the same file extension e.g. mp4


echo "**************************** START *****************************"

cd $1

for f in *.mp4;

do

	echo "file '$f'" >> video_list.txt

done

echo "mylist.txt generated successful. Let's concat!"
## Use directory name as output video name

output_name=${PWD##*/}

ffmpeg -f concat -safe 0 -i video_list.txt -c copy "$output_name".mp4

echo "$output_name.mp4 is the combined clip." >> video_list.txt

echo "**************************** FINISHED ****************************"
