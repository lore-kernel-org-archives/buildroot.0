From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 29 Jun 2021 21:23:48 +0200
Subject: [Buildroot] [PATCH 2/2] configs/kontron_smarc_sal28: use kernel
 5.13
In-Reply-To: <20210628110943.13930-2-michael@walle.cc>
References: <20210628110943.13930-1-michael@walle.cc>
 <20210628110943.13930-2-michael@walle.cc>
Message-ID: <20210629192348.GI2829@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Michael, All,

On 2021-06-28 13:09 +0200, Michael Walle spake thusly:
> Signed-off-by: Michael Walle <michael@walle.cc>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  configs/kontron_smarc_sal28_defconfig | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/configs/kontron_smarc_sal28_defconfig b/configs/kontron_smarc_sal28_defconfig
> index 853c7c308a..ba18cc51cb 100644
> --- a/configs/kontron_smarc_sal28_defconfig
> +++ b/configs/kontron_smarc_sal28_defconfig
> @@ -1,6 +1,6 @@
>  BR2_aarch64=y
>  BR2_cortex_a72=y
> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_12=y
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_13=y
>  BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
>  BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
>  BR2_ROOTFS_OVERLAY="board/kontron/smarc-sal28/rootfs_overlay"
> @@ -9,7 +9,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
>  BR2_ROOTFS_POST_SCRIPT_ARGS="-c $(BINARIES_DIR)/genimage.cfg"
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.12"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.13"
>  BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
>  BR2_LINUX_KERNEL_DTS_SUPPORT=y
>  BR2_LINUX_KERNEL_INTREE_DTS_NAME="freescale/fsl-ls1028a-kontron-sl28 freescale/fsl-ls1028a-kontron-sl28-var2 freescale/fsl-ls1028a-kontron-sl28-var3-ads2 freescale/fsl-ls1028a-kontron-sl28-var4 freescale/fsl-ls1028a-kontron-kbox-a-230-ls"
> -- 
> 2.20.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
