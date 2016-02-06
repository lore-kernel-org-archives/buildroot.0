From: Romain Naour <romain.naour@gmail.com>
Date: Sun, 7 Feb 2016 00:01:00 +0100
Subject: [Buildroot] [PATCH v2 12/18] erlang-p1-tls: bump to version
	1.0.0
In-Reply-To: <1454443064-14269-13-git-send-email-fhunleth@troodon-software.com>
References: <1454443064-14269-1-git-send-email-fhunleth@troodon-software.com>
 <1454443064-14269-13-git-send-email-fhunleth@troodon-software.com>
Message-ID: <56B67B2C.9010209@gmail.com>
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
>  package/erlang-p1-tls/erlang-p1-tls.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/erlang-p1-tls/erlang-p1-tls.mk b/package/erlang-p1-tls/erlang-p1-tls.mk
> index 4f1fc48..f7212c4 100644
> --- a/package/erlang-p1-tls/erlang-p1-tls.mk
> +++ b/package/erlang-p1-tls/erlang-p1-tls.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -ERLANG_P1_TLS_VERSION = b070004
> +ERLANG_P1_TLS_VERSION = 1.0.0
>  ERLANG_P1_TLS_SITE = $(call github,processone,tls,$(ERLANG_P1_TLS_VERSION))
>  ERLANG_P1_TLS_LICENSE = GPLv2+
>  ERLANG_P1_TLS_LICENSE_FILES = COPYING
> 
