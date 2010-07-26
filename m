From: Sergio Monteiro Basto <sergio@sergiomb.no-ip.org>
Date: Mon, 26 Jul 2010 04:48:09 +0100
Subject: [Buildroot] makedevs: line 49: regular file (...)
 buildroot/output/target/usr/share/udhcpc/default.script does not exist: No
 such file or directory
Message-ID: <1280116089.28885.29.camel@segulix>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,
I got this error too , with buildroot-2010.05.

After read some threads in this mailing list is this some error , 
to work around I done:
cd output/target/usr/share
ln -s ../../../../target/generic/target_skeleton/usr/share/udhcpc

and build rootfs , is this correct ? the target is a mips32r2 . 

Thanks,
-- 
S?rgio M. B.
-------------- next part --------------
A non-text attachment was scrubbed...
Name: smime.p7s
Type: application/x-pkcs7-signature
Size: 3293 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100726/cb010c7d/attachment.bin>
