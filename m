From: Romain Naour <romain.naour@gmail.com>
Date: Mon, 1 Feb 2016 22:04:47 +0100
Subject: [Buildroot] [PATCH 13/18] erlang-p1-utils: bump to version 1.0.3
In-Reply-To: <1453511471-28519-14-git-send-email-fhunleth@troodon-software.com>
References: <1453511471-28519-1-git-send-email-fhunleth@troodon-software.com>
 <1453511471-28519-14-git-send-email-fhunleth@troodon-software.com>
Message-ID: <56AFC86F.1060701@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Frank, All,

Le 23/01/2016 02:11, Frank Hunleth a ?crit :
> Signed-off-by: Frank Hunleth <fhunleth@troodon-software.com>
> ---
>  package/erlang-p1-utils/erlang-p1-utils.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/erlang-p1-utils/erlang-p1-utils.mk b/package/erlang-p1-utils/erlang-p1-utils.mk
> index c01d6d5..04d6bd3 100644
> --- a/package/erlang-p1-utils/erlang-p1-utils.mk
> +++ b/package/erlang-p1-utils/erlang-p1-utils.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -ERLANG_P1_UTILS_VERSION = 1bf99f9
> +ERLANG_P1_UTILS_VERSION = 1.0.3
>  ERLANG_P1_UTILS_SITE = $(call github,processone,p1_utils,$(ERLANG_P1_UTILS_VERSION))
>  ERLANG_P1_UTILS_LICENSE = GPLv2+
>  ERLANG_P1_UTILS_LICENSE_FILES = COPYING

The license file has been updated: COPYING -> LICENSE.txt
It seems that all other erlang package have updated their license file.

Don't forget to test your series with legal-info ;-)

Best regards,
Romain


> 
