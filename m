From: Ulf Samuelsson <ulf@atmel.com>
Date: Thu, 25 Jan 2007 23:56:23 +0100
Subject: [Buildroot] [PATCH] Prepatory patch to Config.in to allow
	AT91/AVR32 support	(Resend)
Message-ID: <1169765783.25586.12.camel@elrond.sweden.atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Resend due to a small problem



1) Prepatory patch to allow AVR32/AT91 support.
2) Introduce AVR32 target architecture "avr32"
3) Introduce AVR32 target variants (AP7000/AP7010/AP7020) 
4) Introduce Download location for patches/packages for Atmel chips
(BR2_ATMEL_MIRROR)
5) Introduce Download location for Community AT91 patches/packages
(BR2_AT91_PATCH_MIRROR)

Best Regards
Ulf Samuelsson


-------------- next part --------------
A non-text attachment was scrubbed...
Name: Atmel_Config.in.patch
Type: text/x-patch
Size: 3253 bytes
Desc: not available
Url : http://busybox.net/lists/buildroot/attachments/20070125/1aef5d58/attachment.bin 
