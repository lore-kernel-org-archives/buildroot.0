From: Arun Reddy <reddyac@gmail.com>
Date: Wed, 16 Apr 2008 18:14:29 -0700
Subject: [Buildroot] Need help with VirtualBox after creating bootable
	filesystem image with buildroot
Message-ID: <326f33790804161814i4e742ba2m35b26f29fadec496@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi everyone,

I am asking this question here in order to truly determine whether my issue
deals with Buildroot or with VirtualBox.

I have created my filesystem image with buildroot, called rootfs.i386.ext2.
This filesystem is not bootable, so I made use of the script in
.../buildroot/scripts called build-ext3-img (after a little modification) to
create for me a bootable filesystem image where it can locate my bootloader
GRUB. The resulting final image is called buildroot.img.

I now want to boot this using VirtualBox, and was curious if anyone here has
encountered problems with VirtualBox. My problem is that when I use the
"convertdd" command to convert buildroot.img to a .vdi file that I want to
load and run my newly buildroot-made system, I am given the error stating
that no bootable medium could be found.

I think the problem is not with buildroot.img, but that convertdd in
VBoxManage (used in VirtualBox) does not properly convert the filesystem
image with the bootloader.

Can anyone who has used VirtualBox give me some ideas on how I can actually
create the appropriate .vdi file? Is my problem with the buildroot image or
is it with VirtualBox?

Thanks!!!

Arun
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20080416/50612f56/attachment.htm 
