From: Gary Partis <gary@partis.co.uk>
Date: Tue, 17 Feb 2015 12:58:10 -0000
Subject: [Buildroot] grub2 and 2015.02-rc2
Message-ID: <01df01d04ab1$6283b550$278b1ff0$@partis.co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all

 

I use BR2_ROOTFS_POST_IMAGE_SCRIPT to generate a disk image after completing
a build, and most of the commands work great using the "hosted" versions
within the build (ie. dd, parted, mkefs, e2cp etc).

 

However, when calling "grub-install", it throws back the error 

 

/home/gary/buildroot/buildroot-2015.02-rc2/output/host/usr/sbin/grub-install
: line 79: /usr/share/grub/grub-mkconfig_lib: No such file or directory

 

as it is attempting to access a file in the host's filesystem, and not the
"hosted" version.

 

Is there a simple workaround for this, or am I missing something really
obvious?

 

Thanks in advance,

 

Gary Partis

 

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150217/ef8681e3/attachment.html>
