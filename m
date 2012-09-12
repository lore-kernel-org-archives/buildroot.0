From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 12 Sep 2012 13:19:55 +0300
Subject: [Buildroot] [PATCH] wpa_supplicant: add license information
In-Reply-To: <50505623.7000903@mimc.co.uk>
References: <50505623.7000903@mimc.co.uk>
Message-ID: <20120912101955.GB15924@sapphire.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Mark,

On Wed, Sep 12, 2012 at 10:30:11AM +0100, Mark Jackson wrote:
> Signed-off-by: Mark Jackson <mpfj@newflow.co.uk>
> ---
>  package/wpa_supplicant/wpa_supplicant.mk |    2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/package/wpa_supplicant/wpa_supplicant.mk b/package/wpa_supplicant/wpa_supplicant.mk
> index 9d957ea..34c5a0b 100644
> --- a/package/wpa_supplicant/wpa_supplicant.mk
> +++ b/package/wpa_supplicant/wpa_supplicant.mk
> @@ -6,6 +6,8 @@
> 
>  WPA_SUPPLICANT_VERSION = 1.0
>  WPA_SUPPLICANT_SITE = http://hostap.epitest.fi/releases
> +WPA_SUPPLICANT_LICENSE = GPLv2

wpa_supplicant (and hostapd) are under a dual license GPLv2/BSD-3c. See the 
README file.

baruch

> +WPA_SUPPLICANT_LICENSE_FILES = COPYING
>  WPA_SUPPLICANT_CONFIG = $(WPA_SUPPLICANT_DIR)/wpa_supplicant/.config
>  WPA_SUPPLICANT_SUBDIR = wpa_supplicant
>  WPA_SUPPLICANT_DBUS_SERVICE = fi.epitest.hostap.WPASupplicant

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
