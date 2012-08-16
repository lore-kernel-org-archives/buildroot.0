From: Stephan Hoffmann <sho@relinux.de>
Date: Thu, 16 Aug 2012 11:27:57 +0200
Subject: [Buildroot] Cannot build QT on ARM Cortex A8
Message-ID: <502CBD1D.4000902@relinux.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello all,

I am currently trying to build QT embedded for Cortex A8 (Freescale
iMX53) without success.

I have a working configuration for x86_64 qemu attached as qttest_defconfig.

After changing the architecture from x86_64 to arm Cortex A8 I get the
message
> You have asked to use pkg-config and are cross-compiling.
> Please make sure you have a correctly set-up pkg-config
> environment!
and the build stops. Attached you find the not working defconfig.

I am using cloned buildroot 2012.08-rc2

Kind regards

Stephan

-- 
reLinux     -    Stephan Hoffmann
Am Schmidtgrund 124    50765 K?ln
Tel. +49.221.95595-19    Fax: -64
www.reLinux.de     sho at reLinux.de


-------------- next part --------------
An embedded and charset-unspecified text was scrubbed...
Name: defconfig
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120816/d7e6ac45/attachment.ksh>
-------------- next part --------------
An embedded and charset-unspecified text was scrubbed...
Name: qttest_defconfig
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120816/d7e6ac45/attachment-0001.ksh>
