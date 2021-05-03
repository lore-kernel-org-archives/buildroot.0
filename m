From: =?UTF-8?Q?Roberto_Alejandro_Esp=C3=AD_Mu=C3=B1oz?= <teratux@gmail.com>
Date: Mon, 3 May 2021 11:18:06 -0400
Subject: [Buildroot] problems building a system for Rpi4
Message-ID: <CAG-SZaJqi-sMUtj2R0HRwvpST1WRdQSF7eA3iDi6n=g-gEB=XQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello, I'm having some trouble getting my build to boot on a RPi4.  I
initially tried building the default config version for 64 bits
(raspberrypi4_64_defconfig) and it builds and boots ok with no problem.  I
need to change the system to use glibc but whenever I manage to build the
system and boot it I get a kernel panic error: Attempted to kill init with
exitcode=0x00007f00.  The only change I'm making is switching over to a
glibc toolchain and so far no progress.

I'm using buildroot buildroot-2020.11.3 and I attached my current config.

Thanks in advance

-- 
teratux
------------
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20210503/d766f99a/attachment.html>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: .config
Type: application/octet-stream
Size: 104288 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20210503/d766f99a/attachment.obj>
