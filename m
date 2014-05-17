From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 17 May 2014 16:13:42 +0200
Subject: [Buildroot] [PATCH v7 17/31] xbmc-pvr-addons: Version bump to
 xbmc Gotham-compatible addon
In-Reply-To: <1400326806-16428-18-git-send-email-bernd.kuhls@t-online.de>
References: <1400326806-16428-1-git-send-email-bernd.kuhls@t-online.de>
 <1400326806-16428-18-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20140517161342.5e745481@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Sat, 17 May 2014 13:39:52 +0200, Bernd Kuhls wrote:
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  .../xbmc-pvr-addons/xbmc-pvr-addons-buildfix.patch |  226 ++++++++++++++++++++
>  package/xbmc-pvr-addons/xbmc-pvr-addons.mk         |    4 +-
>  2 files changed, 227 insertions(+), 3 deletions(-)
>  create mode 100644 package/xbmc-pvr-addons/xbmc-pvr-addons-buildfix.patch
> 
> diff --git a/package/xbmc-pvr-addons/xbmc-pvr-addons-buildfix.patch b/package/xbmc-pvr-addons/xbmc-pvr-addons-buildfix.patch
> new file mode 100644
> index 0000000..aedaf6f
> --- /dev/null
> +++ b/package/xbmc-pvr-addons/xbmc-pvr-addons-buildfix.patch

Please use sequence numbers for the patches.

> @@ -0,0 +1,226 @@
> +patch taken from OpenElec
> +
> +https://github.com/OpenELEC/OpenELEC.tv/blob/5d7777390abcb59cdc8f99c4253f89da94a8055c/packages/mediacenter/xbmc-pvr-addons/patches/xbmc-pvr-addons-buildfix.patch
> +
> +Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Besides the origin of the patch, we also usually like to have a
description here.


> diff --git a/package/xbmc-pvr-addons/xbmc-pvr-addons.mk b/package/xbmc-pvr-addons/xbmc-pvr-addons.mk
> index b6d061b..0f229a4 100644
> --- a/package/xbmc-pvr-addons/xbmc-pvr-addons.mk
> +++ b/package/xbmc-pvr-addons/xbmc-pvr-addons.mk
> @@ -4,9 +4,7 @@
>  #
>  ################################################################################
>  
> -# This cset is on the branch 'frodo'
> -# When XBMC is updated, then this should be updated to the corresponding branch

I think this comment was quite useful. Could we keep it, after updating
it?

> -XBMC_PVR_ADDONS_VERSION = 319351af7f3b546a5a56cdf6492f6ba1aec1cd2f
> +XBMC_PVR_ADDONS_VERSION = f38b2ebdc6f96244d5e4bc584315f4a2c24bc787
>  XBMC_PVR_ADDONS_SITE = $(call github,opdenkamp,xbmc-pvr-addons,$(XBMC_PVR_ADDONS_VERSION))
>  XBMC_PVR_ADDONS_LICENSE = GPLv3+
>  XBMC_PVR_ADDONS_LICENSE_FILES = COPYING

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
