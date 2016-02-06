From: Romain Naour <romain.naour@gmail.com>
Date: Sat, 6 Feb 2016 23:45:31 +0100
Subject: [Buildroot] [PATCH v2 08/18] erlang-p1-iconv: bump to version
 0.9.0
In-Reply-To: <1454443064-14269-9-git-send-email-fhunleth@troodon-software.com>
References: <1454443064-14269-1-git-send-email-fhunleth@troodon-software.com>
 <1454443064-14269-9-git-send-email-fhunleth@troodon-software.com>
Message-ID: <56B6778B.1070803@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Frank, All,

Le 02/02/2016 20:57, Frank Hunleth a ?crit :
> Signed-off-by: Frank Hunleth <fhunleth@troodon-software.com>

Reviewed-by: Romain Naour <romain.naour@gmail.com>

Best regards,
Romain

> ---
>  package/erlang-p1-iconv/erlang-p1-iconv.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/erlang-p1-iconv/erlang-p1-iconv.mk b/package/erlang-p1-iconv/erlang-p1-iconv.mk
> index 2189f01..d2d2626 100644
> --- a/package/erlang-p1-iconv/erlang-p1-iconv.mk
> +++ b/package/erlang-p1-iconv/erlang-p1-iconv.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -ERLANG_P1_ICONV_VERSION = dff5ee5
> +ERLANG_P1_ICONV_VERSION = 0.9.0
>  ERLANG_P1_ICONV_SITE = $(call github,processone,eiconv,$(ERLANG_P1_ICONV_VERSION))
>  ERLANG_P1_ICONV_LICENSE = GPLv2+
>  ERLANG_P1_ICONV_LICENSE_FILES = COPYING
> 
