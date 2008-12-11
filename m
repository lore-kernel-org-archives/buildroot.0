From: Matt Wood <mattwood2000@gmx.net>
Date: Thu, 11 Dec 2008 21:31:55 +0100
Subject: [Buildroot] at91sam9g20dfc_defconfig - no u-boot (mkimage)???
Message-ID: <20081211203155.142270@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi guys...just downloaded the latest trunk to test the AT91SAM9G20 build.  I notice that there is no u-boot monitor option under Ateml Device Support.  When I try to build it anyway, I get an error saying mkimage is not found...obviously because u-boot has not been built yet.

Anyone else find this?

Thanks, Matt.
