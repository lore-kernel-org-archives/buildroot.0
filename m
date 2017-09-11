From: John O'Sullivan <John.OSullivan@BlackBox.com>
Date: Mon, 11 Sep 2017 17:08:37 +0000
Subject: [Buildroot] Problem trying to use an external tool chain
Message-ID: <1505149717462.81961@BlackBox.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I am trying to setup buildroot to use an external project from Xilinx

It has the followiing structure

aarch64-linux-gnu  bin  include  lib  lib64  libexec  share



>>> toolchain-external-custom  Installing to staging directory
/usr/bin/install -D -m 0755 /home/developer/BuildRoot/buildroot-2017.02.4/output/build/toolchain-external-custom/toolchain-wrapper /home/developer/BuildRoot/buildroot-2017.02.4/output/host/usr/bin/toolchain-wrapper
ln: failed to create symbolic link '/home/developer/BuildRoot/buildroot-2017.02.4/output/host/usr/aarch64-buildroot-linux-gnu/sysroot/usr/lib': No such file or directory


Anyone have any idea on what its failing on, what lis it trying to link

'/home/developer/BuildRoot/buildroot-2017.02.4/output/host/usr/aarch64-buildroot-linux-gnu/sysroot/usr/lib to

Is it something to do with the fact that it is 64 bit


Regards

John

I

________________________________

This email and any files transmitted with it are confidential and are intended for the sole use of the individual to whom they are addressed. Black Box Corporation reserves the right to scan all e-mail traffic for restricted content and to monitor all e-mail in general. If you are not the intended recipient or you have received this email in error, any use, dissemination or forwarding of this email is strictly prohibited. If you have received this email in error, please notify the sender by replying to this email.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20170911/d6a34029/attachment.html>
