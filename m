From: Romain Naour <romain.naour@openwide.fr>
Date: Sat, 3 Oct 2015 23:23:29 +0200
Subject: [Buildroot] [PATCH 08/18] linux: remove now-redundant ccache
 handling
In-Reply-To: <1442774504-22799-9-git-send-email-arnout@mind.be>
References: <1442774504-22799-1-git-send-email-arnout@mind.be>
 <1442774504-22799-9-git-send-email-arnout@mind.be>
Message-ID: <56104751.8020609@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout,

Le 20/09/2015 20:41, Arnout Vandecappelle (Essensium/Mind) a ?crit :
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

Reviewed-by: Romain Naour <romain.naour@openwide.fr>

Best regards,
Romain
> ---
>  linux/linux.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/linux/linux.mk b/linux/linux.mk
> index bbcc54b..2319576 100644
> --- a/linux/linux.mk
> +++ b/linux/linux.mk
> @@ -67,7 +67,7 @@ LINUX_MAKE_FLAGS = \
>  	HOSTCFLAGS="$(HOSTCFLAGS)" \
>  	ARCH=$(KERNEL_ARCH) \
>  	INSTALL_MOD_PATH=$(TARGET_DIR) \
> -	CROSS_COMPILE="$(CCACHE) $(TARGET_CROSS)" \
> +	CROSS_COMPILE="$(TARGET_CROSS)" \
>  	DEPMOD=$(HOST_DIR)/sbin/depmod
>  
>  LINUX_MAKE_ENV = \
> 
