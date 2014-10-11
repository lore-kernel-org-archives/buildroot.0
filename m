From: Baruch Siach <baruch@tkos.co.il>
Date: Sat, 11 Oct 2014 21:27:57 +0300
Subject: [Buildroot] [PATCH 1/1] package/hostapd: bump to version 2.3
In-Reply-To: <1412953263-8864-1-git-send-email-jkrause@posteo.de>
References: <1412953263-8864-1-git-send-email-jkrause@posteo.de>
Message-ID: <20141011182757.GB3500@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi J?rg,

On Fri, Oct 10, 2014 at 05:01:03PM +0200, J?rg Krause wrote:
> Signed-off-by: J?rg Krause <jkrause@posteo.de>
> ---
>  package/hostapd/hostapd.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/hostapd/hostapd.mk b/package/hostapd/hostapd.mk
> index 90f2e96..dec9ef8 100644
> --- a/package/hostapd/hostapd.mk
> +++ b/package/hostapd/hostapd.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -HOSTAPD_VERSION = 2.2
> +HOSTAPD_VERSION = 2.3
>  HOSTAPD_SITE = http://hostap.epitest.fi/releases
>  HOSTAPD_SUBDIR = hostapd
>  HOSTAPD_CONFIG = $(HOSTAPD_DIR)/$(HOSTAPD_SUBDIR)/.config

Thanks.

It would be helpful to note that this and the wpa_supplicant version bump both 
fix CVE-2014-3686 (http://w1.fi/security/2014-1/wpacli-action-scripts.txt) 
which seems to be a remote root exploit.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
