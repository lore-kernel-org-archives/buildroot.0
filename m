From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 10 Jun 2018 14:16:09 +0200
Subject: [Buildroot] [PATCH] orangepi_pc_defconfig: bump linux to 4.17,
 u-boot to 2018.05
In-Reply-To: <20180609143132.27879-1-peter@korsgaard.com>
References: <20180609143132.27879-1-peter@korsgaard.com>
Message-ID: <20180610141609.6c07bdd3@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat,  9 Jun 2018 16:31:32 +0200, Peter Korsgaard wrote:

> @@ -29,5 +32,3 @@ BR2_PACKAGE_HOST_DOSFSTOOLS=y
>  BR2_PACKAGE_HOST_GENIMAGE=y
>  BR2_PACKAGE_HOST_MTOOLS=y
>  BR2_PACKAGE_HOST_UBOOT_TOOLS=y
> -BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
> -BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/orangepi/orangepi-pc/genimage.cfg"

It's not clear why you're dropping genimage support. Is this a mistake ?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
