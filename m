From: Nikolay Dimitrov <picmaster@mail.bg>
Date: Thu, 30 Apr 2015 19:04:45 +0300
Subject: [Buildroot] [PATCH 1/1] configs/riotboard: bump u-boot to
	version 2015.04
In-Reply-To: <1430253524-22053-1-git-send-email-picmaster@mail.bg>
References: <1430253524-22053-1-git-send-email-picmaster@mail.bg>
Message-ID: <5542529D.7070707@mail.bg>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi guys,

On 04/28/2015 11:38 PM, Nikolay Dimitrov wrote:
> Signed-off-by: Nikolay Dimitrov <picmaster@mail.bg>
> ---
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

Please don't apply this patch. Additional testing revealed an issue.
I'll send an update when I find a solution. Thanks.

Regards,
Nikolay
