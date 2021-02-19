echo "**************************** START *****************************"

cd $1

for f in *.mp4;

do echo "file '$f'" >> mylist.txt;

done

echo "mylist.txt generated successful. Let's concat!"
## Use directory name as output video name

output_name=${PWD##*/}

ffmpeg -f concat -safe 0 -i mylist.txt -c copy $output_name.mp4
echo "cleaning up mylist.txt ..."

rm mylist.txt
echo "**************************** FINISHED ****************************"
