From: Shaun Burdick <buildroot@shaunburdick.com>
Date: Sun, 17 Sep 2006 11:27:40 -0400
Subject: [Buildroot] Make ISO problem/Virtual Machine vmdk
Message-ID: <450D696C.9060700@shaunburdick.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,
I am having a problem with the .iso output of buildroot.
I am able to finish a build of buildroot without an iso and the .ext2
filesystem comes out fine.
For some reason it fails saying it can't find '/stage2/stage2_eltorito'
Full message:
make[4]: Leaving directory
`/home/shaun/svn/buildroot/build_i686/cdrtools-2.01/man/man4'
make[3]: Leaving directory
`/home/shaun/svn/buildroot/build_i686/cdrtools-2.01/man/man4'
make[2]: Leaving directory
`/home/shaun/svn/buildroot/build_i686/cdrtools-2.01/man'
make[1]: Leaving directory
`/home/shaun/svn/buildroot/build_i686/cdrtools-2.01'
touch -c /home/shaun/svn/buildroot/build_i686/cdrtools-2.01/mkisofs
mkdir -p /home/shaun/svn/buildroot/build_i686/iso9660
mkdir -p /home/shaun/svn/buildroot/build_i686/iso9660/boot/grub
cp /stage2/stage2_eltorito
/home/shaun/svn/buildroot/build_i686/iso9660/boot/grub/
cp: cannot stat `/stage2/stage2_eltorito': No such file or directory
make: *** [/home/shaun/svn/buildroot/rootfs.i686.new.iso] Error 1

The full make output is in the attached make.txt along with my .config

Is there something I need to get and add to it?  I am at the latest svn
checkout.

In an unrelated note, should I even bother? I am just trying to create a
virtual machine, I just haven't seen a way to convert the rootfs to a .vmdk?
-------------- next part --------------
An embedded and charset-unspecified text was scrubbed...
Name: .config
Url: http://busybox.net/lists/buildroot/attachments/20060917/7577963b/attachment-0001.pot 
-------------- next part --------------
An embedded and charset-unspecified text was scrubbed...
Name: make.txt
Url: http://busybox.net/lists/buildroot/attachments/20060917/7577963b/attachment-0001.txt 
