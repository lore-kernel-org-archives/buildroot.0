From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 13 Aug 2014 09:25:18 +0200
Subject: [Buildroot] [PATCH] package/xbmc: Bump version to 13.2rc1
In-Reply-To: <1407906206-7513-1-git-send-email-bernd.kuhls@t-online.de>
References: <1407906206-7513-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20140813092518.4d70cd10@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter,

On Wed, 13 Aug 2014 07:03:26 +0200, Bernd Kuhls wrote:
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/xbmc/xbmc.mk |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/xbmc/xbmc.mk b/package/xbmc/xbmc.mk
> index a7c8080..eaa21c9 100644
> --- a/package/xbmc/xbmc.mk
> +++ b/package/xbmc/xbmc.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -XBMC_VERSION = 13.2b3-Gotham
> +XBMC_VERSION = 13.2rc1-Gotham
>  XBMC_SOURCE = $(XBMC_VERSION).tar.gz
>  XBMC_SITE = https://github.com/xbmc/xbmc/archive
>  XBMC_LICENSE = GPLv2

If you commit this, then I suggest it goes to 'master' and not 'next'.
While we normally merge version bumps in 'next' at this point, this
version bump is a bump from a "beta" version to a "release candidate"
version, so it should normally bring more stability/fixes to XBMC.

Bernd: it would have been good to have made this explicit in the commit
log.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
