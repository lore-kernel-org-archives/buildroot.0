From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 2 Apr 2018 17:36:54 +0200
Subject: [Buildroot] [PATCH v3 1/1] configs: beaglebone: bump kernel and
 uboot version
In-Reply-To: <20180215113718.27952-1-lothar.felten@gmail.com>
References: <20180215113718.27952-1-lothar.felten@gmail.com>
Message-ID: <20180402173654.384bf487@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 15 Feb 2018 12:37:18 +0100, Lothar Felten wrote:
> Switch to Linux kernel version 4.9.59 from the TI SDK 04.02.00.09
> (TI SDK release date: 23.12.2017)
> Updated uboot to version 2018.01
> uEnv.txt corrected to boot from sd card on the ti-am335x-evm
> 
> Signed-off-by: Lothar Felten <lothar.felten@gmail.com>

Applied to master, thanks. What about beaglebone_qt5_defconfig ? This
one is getting a bit outdated :/

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
