From: Lothar Felten <lothar.felten@gmail.com>
Date: Tue, 03 Apr 2018 09:21:00 +0200
Subject: [Buildroot] [PATCH v3 1/1] configs: beaglebone: bump kernel and
 uboot version
In-Reply-To: <20180402173654.384bf487@windsurf>
References: <20180215113718.27952-1-lothar.felten@gmail.com>
 <20180402173654.384bf487@windsurf>
Message-ID: <1522740060.7988.17.camel@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

On Mon, 2018-04-02 at 17:36 +0200, Thomas Petazzoni wrote:
> Hello,
> 
> On Thu, 15 Feb 2018 12:37:18 +0100, Lothar Felten wrote:
> > Switch to Linux kernel version 4.9.59 from the TI SDK 04.02.00.09
> > (TI SDK release date: 23.12.2017)
> > Updated uboot to version 2018.01
> > uEnv.txt corrected to boot from sd card on the ti-am335x-evm
> > 
> > Signed-off-by: Lothar Felten <lothar.felten@gmail.com>
> 
> Applied to master, thanks. What about beaglebone_qt5_defconfig ? This
> one is getting a bit outdated :/

The current qt5_defconfig uses old SGX binaries which do not depend on
libgbm and wayland.
Newer versions of the binaries would probably need a new package to
provide (ti-)libgbm.
I'll have to try it again with the binaries used by the latest SDK
release.

> 
> Best regards,
> 
> Thomas

Best regards,
Lothar
