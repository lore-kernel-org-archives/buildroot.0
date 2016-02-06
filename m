From: Romain Naour <romain.naour@gmail.com>
Date: Sat, 6 Feb 2016 23:58:36 +0100
Subject: [Buildroot] [PATCH v2 11/18] erlang-p1-sip: bump to version
	1.0.0
In-Reply-To: <1454443064-14269-12-git-send-email-fhunleth@troodon-software.com>
References: <1454443064-14269-1-git-send-email-fhunleth@troodon-software.com>
 <1454443064-14269-12-git-send-email-fhunleth@troodon-software.com>
Message-ID: <56B67A9C.4010101@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Frank, All,

Le 02/02/2016 20:57, Frank Hunleth a ?crit :
> Signed-off-by: Frank Hunleth <fhunleth@troodon-software.com>

If erlang-p1_stun rename is keep as is:
Reviewed-by: Romain Naour <romain.naour@gmail.com>

Best regards,
Romain

> ---
>  package/erlang-p1-sip/erlang-p1-sip.mk | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/erlang-p1-sip/erlang-p1-sip.mk b/package/erlang-p1-sip/erlang-p1-sip.mk
> index d017a92..eb963c8 100644
> --- a/package/erlang-p1-sip/erlang-p1-sip.mk
> +++ b/package/erlang-p1-sip/erlang-p1-sip.mk
> @@ -4,11 +4,11 @@
>  #
>  ################################################################################
>  
> -ERLANG_P1_SIP_VERSION = fd3e461
> +ERLANG_P1_SIP_VERSION = 1.0.0
>  ERLANG_P1_SIP_SITE = $(call github,processone,p1_sip,$(ERLANG_P1_SIP_VERSION))
>  ERLANG_P1_SIP_LICENSE = GPLv2 with OpenSSL exception
>  ERLANG_P1_SIP_LICENSE_FILES = COPYING
> -ERLANG_P1_SIP_DEPENDENCIES = erlang-p1-stun erlang-p1-tls erlang-p1-utils
> +ERLANG_P1_SIP_DEPENDENCIES = erlang-p1_stun erlang-p1-tls erlang-p1-utils
>  ERLANG_P1_SIP_INSTALL_STAGING = YES
>  
>  $(eval $(rebar-package))
> 
