From: Torsten Mohr <tmohr@s.netic.de>
Date: Tue, 15 Mar 2011 21:20:13 +0100
Subject: [Buildroot] u-boot, setup SD card, BeagleBoard-xM
In-Reply-To: <201103151829.12640.tmohr@s.netic.de>
References: <201103132130.24022.tmohr@s.netic.de>
	<20110315112216.5f3a91e2@surf>
	<201103151829.12640.tmohr@s.netic.de>
Message-ID: <201103152120.13294.tmohr@s.netic.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

when using buildroot-2011.02 it works !!  Hooray.

Though for the linux 2.6.37 the config failed as there is no omap3_defconfig 
in there.  Copying it over from 2.6.36.x made it compile.

u-boot.bin does not show any weird output any more.


Best regards,
Torsten.
