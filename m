From: Baruch Siach <baruch@tkos.co.il>
Date: Sun, 26 Jun 2016 17:14:42 +0300
Subject: [Buildroot] [PATCH 2/2] board: add support for the Odroid XU4
 board
In-Reply-To: <1466950062-31783-3-git-send-email-andi@etezian.org>
References: <1466950062-31783-1-git-send-email-andi@etezian.org>
 <1466950062-31783-3-git-send-email-andi@etezian.org>
Message-ID: <20160626141442.GJ2319@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Andi,

On Sun, Jun 26, 2016 at 05:07:42PM +0300, Andi Shyti wrote:
> The Odroid XU4 board is released by hardkernel and has a Samsunx

Samsung.

> 5422 SoC.

[snip]

> +At the end of the build you should get in the output/images directory the
> +following files:
> +
> + - bl1.bin.hardkernel
> +	Level 1 boot loader
> +
> + - bl2.bin.hardkernel.1mb_uboot
> +	Level 2 boot loader
> +
> + - exynos5422-odroidxu4.dtb
> +	Linux Kernel Device Tree blop
> +
> + - rootfs.tar
> +	Compressed root file system image

Not compressed.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
