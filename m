From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 18 Jan 2015 15:08:04 +0100
Subject: [Buildroot] [PATCH 4/4] package/tvheadend: bump version
In-Reply-To: <1421583404-25251-4-git-send-email-bernd.kuhls@t-online.de>
References: <1421583404-25251-1-git-send-email-bernd.kuhls@t-online.de>
 <1421583404-25251-4-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20150118140804.GE4275@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, All,

On 2015-01-18 13:16 +0100, Bernd Kuhls spake thusly:
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/tvheadend/tvheadend.mk |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/tvheadend/tvheadend.mk b/package/tvheadend/tvheadend.mk
> index 01feb82..d6b77da 100644
> --- a/package/tvheadend/tvheadend.mk
> +++ b/package/tvheadend/tvheadend.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -TVHEADEND_VERSION = c051d0bda5b69ce61e64a97fd4a41db899dcfb53
> +TVHEADEND_VERSION = 7006b9fd88ce0cf54d59399df40fe4ee003c4180
>  TVHEADEND_SITE = $(call github,tvheadend,tvheadend,$(TVHEADEND_VERSION))
>  TVHEADEND_LICENSE = GPLv3+
>  TVHEADEND_LICENSE_FILES = LICENSE.md
> -- 
> 1.7.10.4
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
