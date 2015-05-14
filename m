From: Nikolay Dimitrov <picmaster@mail.bg>
Date: Fri, 15 May 2015 00:02:20 +0300
Subject: [Buildroot] [PATCH v2 1/1] configs/riotboard: bump u-boot to
	version 2015.04
In-Reply-To: <1430807978-24288-1-git-send-email-picmaster@mail.bg>
References: <1430807978-24288-1-git-send-email-picmaster@mail.bg>
Message-ID: <55550D5C.7000705@mail.bg>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi guys,

On 05/05/2015 09:39 AM, Nikolay Dimitrov wrote:
> Signed-off-by: Nikolay Dimitrov <picmaster@mail.bg>
> ---
> Changes v1 -> v2:
>    - None, just did additional testing. v1 was rejected on my request as I
>      suspected that u-boot v2015.04 breaks the network interface, but this
>      is not the case and all works fine.
>
>   configs/riotboard_defconfig |    2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/configs/riotboard_defconfig b/configs/riotboard_defconfig
> index 6e581fa..72c3e04 100644
> --- a/configs/riotboard_defconfig
> +++ b/configs/riotboard_defconfig
> @@ -14,7 +14,7 @@ BR2_ROOTFS_OVERLAY="board/embest/riotboard/rootfs_overlay"
>
>   # bootloader
>   BR2_TARGET_UBOOT=y
> -BR2_TARGET_UBOOT_VERSION="2015.01"
> +BR2_TARGET_UBOOT_VERSION="2015.04"
>   BR2_TARGET_UBOOT_BOARDNAME="riotboard"
>   BR2_TARGET_UBOOT_FORMAT_IMX=y

FYI - don't want to push anyone, but just don't see my resent patch in 
Patchwork, so I was concerned it was "lost in space".

Regards,
Nikolay
