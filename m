From: d p <dogpointer@gmail.com>
Date: Mon, 27 Nov 2006 14:14:19 +0100
Subject: [Buildroot] Gdb & gdbserver segmentation fault
Message-ID: <e3291e320611270514l7c51d9ffkdd45b30003e656e6@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I compiled buildroot under cygwin for a i686 linux target. If I try to
launch the generated target gdb and gdbserver (version 6.5) on a linux
machine with the compiled uClibc libraries copied from the cygwin build I
get a segmentation fault for both the programs.
Gdb and gdbserver also crash with the pre-compiled uClibc development system
(root_fs_i386.ext2.bz2).

Thanks in advance for your help.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20061127/0598093a/attachment.html 
