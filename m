From: Stephan Hoffmann <sho@relinux.de>
Date: Thu, 16 Aug 2012 19:25:43 +0200
Subject: [Buildroot] Solved:  Cannot build QT on ARM Cortex A8
In-Reply-To: <502CBD1D.4000902@relinux.de>
References: <502CBD1D.4000902@relinux.de>
Message-ID: <502D2D17.8060902@relinux.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello all,

I just found the answer in a thread from 13th of July.

The fault was caused by the environment-variable QMAKESPEC

Kind regards

Stephan

Am 16.08.2012 11:27, schrieb Stephan Hoffmann:
> Hello all,
>
> I am currently trying to build QT embedded for Cortex A8 (Freescale
> iMX53) without success.
>
> I have a working configuration for x86_64 qemu attached as qttest_defconfig.
>
> After changing the architecture from x86_64 to arm Cortex A8 I get the
> message
>> You have asked to use pkg-config and are cross-compiling.
>> Please make sure you have a correctly set-up pkg-config
>> environment!
> and the build stops. Attached you find the not working defconfig.
>
> I am using cloned buildroot 2012.08-rc2
>
> Kind regards
>
> Stephan
>
>
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot


-- 
reLinux     -    Stephan Hoffmann
Am Schmidtgrund 124    50765 K?ln
Tel. +49.221.95595-19    Fax: -64
www.reLinux.de     sho at reLinux.de


-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120816/b48c4cfb/attachment.html>
