From: Daniel. <danielhilst@gmail.com>
Date: Mon, 8 Jul 2013 20:08:52 +0000
Subject: [Buildroot] =?windows-1252?q?Error_while_installing_dosfstools=3A?=
	=?windows-1252?q?_mkdosfs=92=3A_No_such_file_or_directory?=
Message-ID: <CAF3SDA4DY8DkDTVr5F4aLxmoJha60Y4DnZ9yC0u7PdhteR3Svg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I'm receiving this error while trying to compile dosfstools
[hilst at archhilst buildroot-2013.05]$ make
>>> dosfstools 3.0.16 Installing to target
test -z "mkdosfs" || install -m 755
/home/hilst/buildroot/buildroot-2013.05/output/build/dosfstools-3.0.16/mkdosfs
/home/hilst/buildroot/buildroot-2013.05/output/target/sbin/
install: cannot stat
?/home/hilst/buildroot/buildroot-2013.05/output/build/dosfstools-3.0.16/mkdosfs?:
No such file or directory
make: ***
[/home/hilst/buildroot/buildroot-2013.05/output/build/dosfstools-3.0.16/.stamp_target_installed]
Error 1
[hilst at archhilst buildroot-2013.05]$ ls -l
/home/hilst/buildroot/buildroot-2013.05/output/build/dosfstools-3.0.16/mkdosfs
ls: cannot access
/home/hilst/buildroot/buildroot-2013.05/output/build/dosfstools-3.0.16/mkdosfs:
No such file or directory
[hilst at archhilst buildroot-2013.05]$

It seems that mkdosfs isn't generated, still I got no copile error..

Cheers,


-- 
*"Do or do not. There is no try"*
*  **Yoda Master*
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130708/00aaf9a4/attachment.html>
