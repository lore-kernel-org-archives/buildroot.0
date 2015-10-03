From: Romain Naour <romain.naour@openwide.fr>
Date: Sat, 3 Oct 2015 23:24:05 +0200
Subject: [Buildroot] [PATCH 09/18] uboot: remove now-redundant ccache
 handling
In-Reply-To: <1442777030-24036-1-git-send-email-arnout@mind.be>
References: <1442774504-22799-1-git-send-email-arnout@mind.be>
 <1442777030-24036-1-git-send-email-arnout@mind.be>
Message-ID: <56104775.2040106@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout,

Le 20/09/2015 21:23, Arnout Vandecappelle (Essensium/Mind) a ?crit :
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

Reviewed-by: Romain Naour <romain.naour@openwide.fr>

Best regards,
Romain

> ---
>  boot/uboot/uboot.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
> index 8f321ac..7494078 100644
> --- a/boot/uboot/uboot.mk
> +++ b/boot/uboot/uboot.mk
> @@ -74,7 +74,7 @@ endif
>  UBOOT_ARCH = $(KERNEL_ARCH)
>  
>  UBOOT_MAKE_OPTS += \
> -	CROSS_COMPILE="$(CCACHE) $(TARGET_CROSS)" \
> +	CROSS_COMPILE="$(TARGET_CROSS)" \
>  	ARCH=$(UBOOT_ARCH)
>  
>  # Helper function to fill the U-Boot config.h file.
> 
