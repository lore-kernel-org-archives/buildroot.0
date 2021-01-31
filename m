From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 31 Jan 2021 23:27:10 +0100
Subject: [Buildroot] [PATCH v2] board/sifive: Update
 hifive_unleashed_defconfig and genimage.cfg
In-Reply-To: <20210129045006.26206-1-bmeng.cn@gmail.com>
References: <20210129045006.26206-1-bmeng.cn@gmail.com>
Message-ID: <20210131232710.3e5c5f85@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 29 Jan 2021 12:50:06 +0800
Bin Meng <bmeng.cn@gmail.com> wrote:

> From: Bin Meng <bin.meng@windriver.com>
> 
> Update to use the official linux kernel v5.10 instead of an
> out-of-tree kernel, and use the official U-Boot v2021.01 as
> the bootloader. Provide two configuration files of genimage
> for different boot flows:
> 
> - Boot from SD card (default)
> - Boot from SPI flash
> 
> A boot script is generated to automatically boot the distro.
> 
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> ---

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
