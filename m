From: Baruch Siach <baruch@tkos.co.il>
Date: Sun, 11 Oct 2015 21:58:19 +0300
Subject: [Buildroot] [PATCH 1/1] package/shairport-sync: bump to version
 2.4.1
In-Reply-To: <1444589560-24258-1-git-send-email-joerg.krause@embedded.rocks>
References: <1444589560-24258-1-git-send-email-joerg.krause@embedded.rocks>
Message-ID: <20151011185819.GI2451@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi J?rg,

On Sun, Oct 11, 2015 at 08:52:40PM +0200, J?rg Krause wrote:
> Remove applied upstream patch.
> 
> Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
> ---
>  package/shairport-sync/shairport-sync.mk | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/package/shairport-sync/shairport-sync.mk b/package/shairport-sync/shairport-sync.mk
> index 36d5b82..bf1409b 100644
> --- a/package/shairport-sync/shairport-sync.mk
> +++ b/package/shairport-sync/shairport-sync.mk
> @@ -4,13 +4,12 @@
>  #
>  ################################################################################
>  
> -SHAIRPORT_SYNC_VERSION = 2.4
> +SHAIRPORT_SYNC_VERSION = 2.4.1
>  SHAIRPORT_SYNC_SITE = $(call github,mikebrady,shairport-sync,$(SHAIRPORT_SYNC_VERSION))
>  
>  SHAIRPORT_SYNC_LICENSE = MIT, BSD-3c
>  SHAIRPORT_SYNC_LICENSE_FILES = LICENSES
>  SHAIRPORT_SYNC_DEPENDENCIES = alsa-lib libconfig libdaemon popt host-pkgconf
> -SHAIRPORT_SYNC_PATCH = https://github.com/mikebrady/shairport-sync/commit/6ae067af1f695e615415cde69a506ad330dbc45b.patch
>  
>  # Touching configure.ac with the patches
>  SHAIRPORT_SYNC_AUTORECONF = YES

Is this still needed, then? Maybe the comment just needs an update (git clone, 
no configure)?

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
