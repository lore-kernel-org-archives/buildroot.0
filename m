From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 02 Dec 2013 22:14:56 +0100
Subject: [Buildroot] [PATCH 3/4] package/dvb-apps: bump version
In-Reply-To: <8ff24edea518d291706dddec42aa360cef4176ed.1385937338.git.yann.morin.1998@free.fr>
References: <cover.1385937338.git.yann.morin.1998@free.fr>
 <8ff24edea518d291706dddec42aa360cef4176ed.1385937338.git.yann.morin.1998@free.fr>
Message-ID: <529CF850.9020907@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 01/12/13 23:36, Yann E. MORIN wrote:
> From: "Yann E. MORIN" <yann.morin.1998@free.fr>
>
> Fixes for scanning DVBS, misc compiler warnings suppressed.
>
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> ---
>   package/dvb-apps/dvb-apps.mk | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/package/dvb-apps/dvb-apps.mk b/package/dvb-apps/dvb-apps.mk
> index 8cf6a79..e351258 100644
> --- a/package/dvb-apps/dvb-apps.mk
> +++ b/package/dvb-apps/dvb-apps.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>
> -DVB_APPS_VERSION        = 83c746462ccb
> +DVB_APPS_VERSION        = be76da69f250

  Didn't we agree to switch to full 40-character hashes? If it goes for 
git, it goes for hg as well, right? :-)

  Regards,
  Arnout

>   DVB_APPS_SITE           = http://linuxtv.org/hg/dvb-apps
>   DVB_APPS_SITE_METHOD    = hg
>
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
