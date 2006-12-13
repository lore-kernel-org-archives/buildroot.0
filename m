From: Rafael A Barrero <rafa@linux.it>
Date: Tue, 12 Dec 2006 21:25:44 -0800
Subject: [Buildroot] iso image creation error
Message-ID: <1F6684BF-36D4-48E6-B6F3-5CFD0CF8C39F@linux.it>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi;

I'm getting an error while creating the iso9660 image of my rootfs.  
The following command is missing the second argument:

cp  /root/src/buildroot/build_i686/iso9660/kernel

Does anybody know what this should be copied to?

Thanks!

"...
/root/src/buildroot/rootfs.i686.ext2:    73.6% -- replaced with /root/ 
src/buildroot/rootfs.i686.ext2.gz
-rw-r--r-- 1 root root 35262656 Dec 12 21:09 /root/src/buildroot/ 
rootfs.i686.ext2.gz
cp /root/src/buildroot/build_i686/grub-0.97/grub/grub /root/src/ 
buildroot/build_i686/root/sbin/
test -d /root/src/buildroot/build_i686/root/boot/grub || mkdir -p / 
root/src/buildroot/build_i686/root/boot/grub
cp /root/src/buildroot/build_i686/grub-0.97/stage1/stage1 /root/src/ 
buildroot/build_i686/grub-0.97/stage2/*1_5 /root/src/buildroot/ 
build_i686/grub-0.97/stage2/stage2 /root/src/buildroot/build_i686/ 
root/boot/grub/
mkdir -p /root/src/buildroot/build_i686/iso9660
mkdir -p /root/src/buildroot/build_i686/iso9660/boot/grub
cp /root/src/buildroot/build_i686/grub-0.97/stage2/stage2_eltorito / 
root/src/buildroot/build_i686/iso9660/boot/grub/
cp target/iso9660/menu.lst /root/src/buildroot/build_i686/iso9660/ 
boot/grub/menu.lst
cp  /root/src/buildroot/build_i686/iso9660/kernel
cp: missing destination file operand after `/root/src/buildroot/ 
build_i686/iso9660/kernel'
Try `cp --help' for more information.
make: *** [/root/src/buildroot/rootfs.i686.iso] Error 1
[root at host buildroot]#
"

Rafael.
