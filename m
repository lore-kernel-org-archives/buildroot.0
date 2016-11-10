From: =?UTF-8?Q?Fran=C3=A7ois_Perrad?= <francois.perrad@gadz.org>
Date: Thu, 10 Nov 2016 18:42:28 +0100
Subject: [Buildroot] [PATCH 1/4] configs/imx233_olinuxino: Add EXT4
	support
In-Reply-To: <1478792388-13279-1-git-send-email-fabio.estevam@nxp.com>
References: <1478792388-13279-1-git-send-email-fabio.estevam@nxp.com>
Message-ID: <CAB0FRsvAJu1m4MqFNKHngq+2GUP+gL=QketP3hU_jmMuNwfUbg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2016-11-10 16:39 GMT+01:00 Fabio Estevam <fabio.estevam@nxp.com>:
> Select BR2_TARGET_ROOTFS_EXT4 so that an EXT4 rootfs can be generated.
>
> Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>

Acked-by: Francois Perrad <francois.perrad@gadz.org>

> ---
>  configs/olimex_imx233_olinuxino_defconfig | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/configs/olimex_imx233_olinuxino_defconfig b/configs/olimex_imx233_olinuxino_defconfig
> index 1040e5e..70e8b5d 100644
> --- a/configs/olimex_imx233_olinuxino_defconfig
> +++ b/configs/olimex_imx233_olinuxino_defconfig
> @@ -32,6 +32,7 @@ BR2_PACKAGE_ZD1211_FIRMWARE=y
>
>  # Filesystem
>  BR2_TARGET_ROOTFS_EXT2=y
> +BR2_TARGET_ROOTFS_EXT4=y
>  # BR2_TARGET_ROOTFS_TAR is not set
>
>  # U-Boot
> --
> 2.7.4
>
