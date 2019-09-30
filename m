From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 30 Sep 2019 07:58:34 +0200
Subject: [Buildroot] [PATCH] linux: fix indentation
In-Reply-To: <1569780965-1224-1-git-send-email-pjtexier@koncepto.io>
References: <1569780965-1224-1-git-send-email-pjtexier@koncepto.io>
Message-ID: <20190930055834.GL7274@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Pierre-Jean, All,

On 2019-09-29 20:16 +0200, Pierre-Jean Texier spake thusly:
> Fixes:
>  $: ./utils/check-package linux/*
>  linux/linux.mk:528: expected indent with tabs
>  1318 lines processed
>  1 warnings generated
> 
> Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>

Acked-by: Yann E. MORIN <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  linux/linux.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/linux/linux.mk b/linux/linux.mk
> index b9e7210..89ac31c 100644
> --- a/linux/linux.mk
> +++ b/linux/linux.mk
> @@ -525,7 +525,7 @@ include $(sort $(wildcard linux/linux-ext-*.mk))
>  
>  # Import linux-kernel-extensions from br2-externals
>  include $(sort $(wildcard $(foreach ext,$(BR2_EXTERNAL_DIRS), \
> -       $(ext)/linux/linux-ext-*.mk)))
> +	$(ext)/linux/linux-ext-*.mk)))
>  
>  LINUX_PATCH_DEPENDENCIES += $(foreach ext,$(LINUX_EXTENSIONS),\
>  	$(if $(BR2_LINUX_KERNEL_EXT_$(call UPPERCASE,$(ext))),$(ext)))
> -- 
> 2.7.4
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
