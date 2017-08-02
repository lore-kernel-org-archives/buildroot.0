From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 2 Aug 2017 21:46:06 +0200
Subject: [Buildroot] [PATCH v2] New board - EVB SoCrates based on Altera
 Cyclone 5
In-Reply-To: <20170802180302.30300-1-michal.lyszczek@gmail.com>
References: <20170802180302.30300-1-michal.lyszczek@gmail.com>
Message-ID: <20170802214606.0ee1bf5e@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed,  2 Aug 2017 20:03:02 +0200, Micha? ?yszczek wrote:
> From: Micha? ?yszczek <michal.lyszczek@bofc.pl>
> 
> Configuration contains:
>   - building uboot (and spl) from altera's github
>   - booting from SD card
>   - working ethernet, serial, i2c, fpga_manager
>   - minimal rootfs with busybox
>   - ready to flash SD card image
> 
> Signed-off-by: Micha? ?yszczek <michal.lyszczek@bofc.pl>
> 
> ---
> Changes v1 -> v2:
>   (all changes suggested by Thomas Petazzoni)
>   - merged boot.scr and boot-env into single boot-env
>   - removed create_sdcard.sh in favor of more complete genimage.cfg
>   - changed size of vfat boot partition to more sane value
>   - removed custom kernel defconfig and used one from kernel source tree
>   - removed custom dts and used one from kernel source tree
>   - corrected spelling in readme.txt
>   - droped some custom config of buildroot (now using default ones)
>   - added missing tools to create sdcard.img
>   - removed binary SPL (all compiled from source now)

I've applied, with the following changes:

    [Thomas:
     - add entry to DEVELOPERS file
     - refresh .gitlab-ci.yml
     - fix commit title]

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
