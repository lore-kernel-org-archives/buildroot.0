From: Chris Wilkinson <winstonian36@gmail.com>
Date: Sun, 17 Mar 2013 21:45:34 -0400
Subject: [Buildroot] Q. vmlinuz on ARM?
Message-ID: <CAHUKsLL9aV9NH-NmtgRmDONGjnAkaeJjJepM65AMq3sU+LBbkw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Is vmlinuz an output option for ARM? It appears to be an option only for
MIPS.

My current iop32x stock kernel is vmlinuz, see below.

root at freestor:/boot# ls -la
total 4597
drwxr-xr-x  3 root root    1024 Mar 16 17:29 .
drwxr-xr-x 21 root root    4096 Mar 16 22:31 ..
-rw-r--r--  1 root root   81828 Feb 25 17:50 config-2.6.32-5-iop32x
lrwxrwxrwx  1 root root      26 Mar 16 17:08 initrd.img ->
initrd.img-2.6.32-5-iop32x
-rw-r--r--  1 root root 2378526 Mar 16 17:29 initrd.img-2.6.32-5-iop32x
drwxr-xr-x  2 root root   12288 Mar 16 16:49 lost+found
-rw-r--r--  1 root root  946840 Feb 25 17:50 System.map-2.6.32-5-iop32x
lrwxrwxrwx  1 root root      23 Mar 16 17:08 vmlinuz ->
vmlinuz-2.6.32-5-iop32x
-rw-r--r--  1 root root 1258000 Feb 25 17:48 vmlinuz-2.6.32-5-iop32x

-- 
-Chris-
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130317/d877e642/attachment.html>
