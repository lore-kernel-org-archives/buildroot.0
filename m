From: Sergey Matyukevich <geomatsi@gmail.com>
Date: Mon, 30 Mar 2020 18:25:07 +0300
Subject: [Buildroot] [PATCH 2/2] nanpi_neo4_config: Enable
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_NEEDS_ARM32_TOOLCHAIN optiony
In-Reply-To: <1585574086-28047-2-git-send-email-marek.belisko@open-nandra.com>
References: <1585574086-28047-1-git-send-email-marek.belisko@open-nandra.com>
 <1585574086-28047-2-git-send-email-marek.belisko@open-nandra.com>
Message-ID: <20200330152507.GA518052@curiosity>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> Signed-off-by: Marek Belisko <marek.belisko@open-nandra.com>
> ---
>  configs/nanopi_neo4_defconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/configs/nanopi_neo4_defconfig b/configs/nanopi_neo4_defconfig
> index 0e58aea..2bffe66 100644
> --- a/configs/nanopi_neo4_defconfig
> +++ b/configs/nanopi_neo4_defconfig
> @@ -11,6 +11,7 @@ BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_GIT=y
>  BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_URL="https://github.com/ARM-software/arm-trusted-firmware"
>  BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_VERSION="v2.0"
>  BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="rk3399"
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_NEEDS_ARM32_TOOLCHAIN=y
>  BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31=y

I would suggest to write proper commit messages for these two patches.

Otherwise neo4 build looks good:
Tested-by: Sergey Matyukevich <geomatsi@gmail.com>

Regards,
Sergey
