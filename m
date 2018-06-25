From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 25 Jun 2018 21:15:55 +0200
Subject: [Buildroot] [PATCH] clearfog: bump kernel and bootloader
In-Reply-To: <1bec88e7569685006a9476d3698fcea0d2f8bf85.1529943617.git.baruch@tkos.co.il>
References: <1bec88e7569685006a9476d3698fcea0d2f8bf85.1529943617.git.baruch@tkos.co.il>
Message-ID: <20180625211555.608bc20f@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 25 Jun 2018 19:20:17 +0300, Baruch Siach wrote:
> Update the kernel version to 4.17.2.
> 
> Update U-Boot version to 2018.05.
> 
> Migrate to U-Boot generic distro configuration which is easier than the
> hand written boot script.
> 
> Improve the 'dd' command example in readme.txt.
> 
> Cc: Jan Kundr?t <jan.kundrat@cesnet.cz>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  board/solidrun/clearfog/boot.scr.txt  |  5 -----
>  board/solidrun/clearfog/extlinux.conf |  4 ++++
>  board/solidrun/clearfog/post-build.sh |  4 +++-
>  board/solidrun/clearfog/readme.txt    |  2 +-
>  configs/solidrun_clearfog_defconfig   | 10 ++++------
>  5 files changed, 12 insertions(+), 13 deletions(-)
>  delete mode 100644 board/solidrun/clearfog/boot.scr.txt
>  create mode 100644 board/solidrun/clearfog/extlinux.conf

I've adjusted the prefix of the commit title and applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
