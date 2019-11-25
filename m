From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 25 Nov 2019 22:59:35 +0100
Subject: [Buildroot] [PATCH v2 05/10] boot/arm-trusted-firmware: Add
 option BR2_TARGET_ARM_TRUSTED_FIRMWARE_UBOOT_BL33_IMAGE
In-Reply-To: <20191121102324.35225-6-jerry.huang@nxp.com>
References: <20191121102324.35225-1-jerry.huang@nxp.com>
 <20191121102324.35225-6-jerry.huang@nxp.com>
Message-ID: <20191125225935.3d045f36@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 21 Nov 2019 18:23:19 +0800
Changming Huang <jerry.huang@nxp.com> wrote:

> From: Jerry Huang <jerry.huang@nxp.com>
> 
> Add option BR2_TARGET_ARM_TRUSTED_FIRMWARE_UBOOT_BL33_IMAGE to define the U-Boot BIN.
> The default setting is u-boot.bin, customer can change it to anything via defconfig.
> 
> Signed-off-by: Jerry Huang <jerry.huang@nxp.com>
> ---
> changes since v1:
> 1. add BR2_TARGET_ARM_TRUSTED_FIRMWARE_UBOOT_BL33_IMAGE for uboot binary file
> 2. default of new option is u-boot.bin.
> 3. use the new option for U-Boot BL33
> ---
>  boot/arm-trusted-firmware/Config.in               | 12 ++++++++++++
>  boot/arm-trusted-firmware/arm-trusted-firmware.mk |  3 ++-
>  2 files changed, 14 insertions(+), 1 deletion(-)

I have applied to next, after reworking the commit log and Config.in
help text.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
