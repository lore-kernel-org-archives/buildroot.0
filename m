From: Chien-Yu Chen <torus0@gmail.com>
Date: Fri, 11 Jul 2008 12:19:35 -0500
Subject: [Buildroot] initramfs /initrd support
Message-ID: <dbc6d8cc0807111019v1be5c43fv2cf3a9f0b0f4e84@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi
  I posted a message regarding kernel keep on growing each time I change the
root filesystem and do a make
I think the problem is because I included initramfs/initrd support.
since in the directory

project_build_i686/MySling/linux-2.6.25/usr/

the two file

initramfs_data.cpio.gz
initramfs_data.o

keeps on growing. does anyone have some idea on what's going on?
I need the initrd since I'll be booting from a CD without a harddrive
support..
thanks

chen

-- 
Any MicroSoft extension file will directly go to trash without any warning
and regret.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20080711/1428eadc/attachment.htm 
