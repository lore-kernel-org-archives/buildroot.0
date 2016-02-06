From: Romain Naour <romain.naour@gmail.com>
Date: Sun, 7 Feb 2016 00:02:17 +0100
Subject: [Buildroot] [PATCH v2 13/18] erlang-p1-utils: bump to version
 1.0.3
In-Reply-To: <1454443064-14269-14-git-send-email-fhunleth@troodon-software.com>
References: <1454443064-14269-1-git-send-email-fhunleth@troodon-software.com>
 <1454443064-14269-14-git-send-email-fhunleth@troodon-software.com>
Message-ID: <56B67B79.4070809@gmail.com>
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
> Changes v1->v2:
>   - Fix license file name
> 
>  package/erlang-p1-utils/erlang-p1-utils.mk | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/erlang-p1-utils/erlang-p1-utils.mk b/package/erlang-p1-utils/erlang-p1-utils.mk
> index c01d6d5..733cf87 100644
> --- a/package/erlang-p1-utils/erlang-p1-utils.mk
> +++ b/package/erlang-p1-utils/erlang-p1-utils.mk
> @@ -4,10 +4,10 @@
>  #
>  ################################################################################
>  
> -ERLANG_P1_UTILS_VERSION = 1bf99f9
> +ERLANG_P1_UTILS_VERSION = 1.0.3
>  ERLANG_P1_UTILS_SITE = $(call github,processone,p1_utils,$(ERLANG_P1_UTILS_VERSION))
>  ERLANG_P1_UTILS_LICENSE = GPLv2+
> -ERLANG_P1_UTILS_LICENSE_FILES = COPYING
> +ERLANG_P1_UTILS_LICENSE_FILES = LICENSE.txt
>  ERLANG_P1_UTILS_INSTALL_STAGING = YES
>  
>  $(eval $(rebar-package))
> 
