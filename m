From: Romain Naour <romain.naour@gmail.com>
Date: Sat, 6 Feb 2016 23:35:39 +0100
Subject: [Buildroot] [PATCH v2 03/18] erlang-goldrush: bump to version
 0.1.8
In-Reply-To: <1454443064-14269-4-git-send-email-fhunleth@troodon-software.com>
References: <1454443064-14269-1-git-send-email-fhunleth@troodon-software.com>
 <1454443064-14269-4-git-send-email-fhunleth@troodon-software.com>
Message-ID: <56B6753B.1090807@gmail.com>
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
>  package/erlang-goldrush/erlang-goldrush.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/erlang-goldrush/erlang-goldrush.mk b/package/erlang-goldrush/erlang-goldrush.mk
> index b18a8ec..2fa8810 100644
> --- a/package/erlang-goldrush/erlang-goldrush.mk
> +++ b/package/erlang-goldrush/erlang-goldrush.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -ERLANG_GOLDRUSH_VERSION = 0.1.6
> +ERLANG_GOLDRUSH_VERSION = 0.1.8
>  ERLANG_GOLDRUSH_SITE = $(call github,DeadZen,goldrush,$(ERLANG_GOLDRUSH_VERSION))
>  ERLANG_GOLDRUSH_LICENSE = ISC
>  ERLANG_GOLDRUSH_LICENSE_FILES = LICENSE
> 
