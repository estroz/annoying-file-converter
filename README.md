### bash script for automating image-to-pdf file conversion

Although this task could be done by hand, I would rather automate it. I found this a fun exercise for bash scripting, albiet simple. 

Notes: 

1. This script uses the `convert` command by [ImageMagick](http://www.imagemagick.org/script/index.php "ImageMagick") to do the actual conversion, all I did was automate the process with file specificity for class assignments
2. bash-specific. Will work in a terminal (Mac) and Cygwin (Windows)
3. Input files:
    * Must begin with a q followed by 1 to 2 numbers (0 to 99), and 0 to 1 letters (a to z)
    * Must have a file prefix of `.JPG`, `.jpeg`, `.png`, `.PNG`, `.tiff`, `.TIFF`, `.gif`, `.GIF`
    * Must be similar to the form: `q1c.JPG` or `q12f.png`

####Setup: (super easy)

1. Install imagemagick:
    2. Ubuntu:

         `# sudo apt-get install imagemagick`
         
    1. [Mac](http://www.imagemagick.org/script/binary-releases.php#macosx) or [Cygwin](http://www.imagemagick.org/script/binary-releases.php) 

2. Move `img2pdf.sh` into directory with your image files

         $ cp ~/Downloads/img2pdf.sh ~/dir/with/img/files

3. Run the script

         $ ./img2pdf.sh

4. Input the assignment # (1, 2, 3, 4) and file extension (must be preceded by '.' ex. .JPG)
5. Your converted files will have the form `assign[0-4]q[0-9]{1,2}[a-z]?.pdf`, ex. `assign1q1.pdf` or `assign4q12h.pdf`, and original files will be unchanged


