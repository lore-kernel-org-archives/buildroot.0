From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Thu, 30 Apr 2015 10:58:56 +0200
Subject: [Buildroot] [v6,
	12/15] nitrogen6x_defconfig: bump kernel to 3.10.17_1.0.1_ga
In-Reply-To: <1421451251-23366-13-git-send-email-jezz@sysmic.org>
References: <1421451251-23366-13-git-send-email-jezz@sysmic.org>
Message-ID: <20150430085856.GL24549@t450s.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

On Sat, Jan 17, 2015 at 12:34:08AM +0100, J?r?me Pouiller wrote:
> Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
> ---
>  configs/nitrogen6x_defconfig | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/configs/nitrogen6x_defconfig b/configs/nitrogen6x_defconfig
> index e56bd60..d75f780 100644
> --- a/configs/nitrogen6x_defconfig
> +++ b/configs/nitrogen6x_defconfig
> @@ -26,7 +26,8 @@ BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="http://github.com/boundarydevices/u-bo
>  # kernel
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
> -BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="http://github.com/boundarydevices/linux-imx6/tarball/898627a/linux-imx6-898627a.tar.gz"
> +# Last version of branch boundary-imx_3.10.17_1.0.1_ga
> +BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/linux-imx6/tarball/ea957c5/linux-imx6-ea957c5.tar.gz"
>  BR2_LINUX_KERNEL_DEFCONFIG="nitrogen6x"
>  BR2_LINUX_KERNEL_INSTALL_TARGET=y
>  BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x10008000"

As explained in my answer to the cover letter, this series of patch has
been successfully tested on a Nitrogen6x board.
http://lists.busybox.net/pipermail/buildroot/2015-April/124739.html

Tested-by: Gary Bisson <gary.bisson@boundarydevices.com>

Reviewed-by: Gary Bisson <gary.bisson@boundarydevices.com>

Regards,
Gary
