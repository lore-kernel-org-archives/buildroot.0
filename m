From: sangam shetty <sangam8245@gmail.com>
Date: Wed, 7 Dec 2011 11:39:51 +0530
Subject: [Buildroot] ST-Ericsson Snowball
Message-ID: <CADcT_i0WXyEU2D88=_iD5Zntem+GpBqeoK1hHRuq_L=oVGv42w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi All,
    I got a snowball board recently. I downloaded the Latest buildroot and
built the cross_compiler for the same(arm-cortex-A9). I wrote a simple
hello world program to see if i have build the things correctly. When i
execute the hello world on the snowball board it is coming up with the
following error :

root at linaro-desktop:/home/linaro# ls -l hello
-rwxrwxrwx 1 root root 4346 2000-01-01 00:04 hello
root at linaro-desktop:/home/linaro# file hello
hello: ELF 32-bit LSB executable, ARM, version 1 (SYSV), dynamically linked
(uses shared libs), not stripped
root at linaro-desktop:/home/linaro# ./hello
-bash: ./hello: No such file or directory
root at linaro-desktop:/home/linaro# ls -l ./hello
-rwxrwxrwx 1 root root 4346 2000-01-01 00:04 ./hello
root at linaro-desktop:/home/linaro#

Can someone tell me what wrong i did or there is no support for snowball in
buildroot. Attachment contains the buildroot config after doing make
menuconfig.

waiting for your replay.

wwr,
sangamesh
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20111207/0427b10c/attachment-0001.html>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: config
Type: application/octet-stream
Size: 20021 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20111207/0427b10c/attachment-0001.obj>
