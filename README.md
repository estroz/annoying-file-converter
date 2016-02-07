### Simple bash script for automating image file to pdf file conversion

Although this task could be done by hand, I would rather just automate it. I als found this a fun exercise for bash scripting, albiet simple. 

Notes: 

1. This script uses `convert` command by [imagemagick](http://www.imagemagick.org/script/index.php "ImageMagick") to do the actual conversion, all I did was add recursion and file specificity for class assignments
2. I run Ubuntu 14.04 on a bash terminal, so this will work for you if you similarly run a similar Linux distro. I'll update for Mac and Cygwin (Windows bash emulator) soon
3. Input files must be similar to the form: "q1c.JPG" or "q12f.png":
  ..*Must begin with a q followed by 1 to 2 numbers (0 to 99), and 0 to 1 letters (a to z)
  ..*Must have a file prefix of .JPG, .jpeg, .png, .PNG, .tiff, .TIFF, .gif, .GIF

####Setup: (super easy)

1. Install imagemagick
```bash
# sudo apt-get install imagemagick
```
2. Move `img2pdf.sh` into directory with your image files
```bash
$ cp ~/Downloads/img2pdf.sh ~/dir/with/img/files
```
3. Run the script
```bash
$ ./img2pdf.sh
```
4. Input the assignment # (1, 2, 3, 4) and file extension (must be preceded by '.' ex. .JPG)
5. Your converted files will have the form `assign[0-4]q[0-9]{1,2}[a-z]?.pdf` ex. "assign1q1.pdf" or "assign4q12h.pdf", and original files will be unchanged


