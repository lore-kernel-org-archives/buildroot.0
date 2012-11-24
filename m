From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 24 Nov 2012 21:48:46 +0100
Subject: [Buildroot] [PATCH 25/33] fluxbox: add license info
In-Reply-To: <1353543503-8952-26-git-send-email-s.martin49@gmail.com>
References: <1353543503-8952-1-git-send-email-s.martin49@gmail.com>
 <1353543503-8952-26-git-send-email-s.martin49@gmail.com>
Message-ID: <50B132AE.4040004@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 22/11/12 01:18, Samuel Martin wrote:
>
> Signed-off-by: Samuel Martin<s.martin49@gmail.com>
> ---
>   package/fluxbox/fluxbox.mk | 3 +++
>   1 file changed, 3 insertions(+)
>
> diff --git a/package/fluxbox/fluxbox.mk b/package/fluxbox/fluxbox.mk
> index bb34379..d8f2723 100644
> --- a/package/fluxbox/fluxbox.mk
> +++ b/package/fluxbox/fluxbox.mk
> @@ -7,6 +7,9 @@
>   FLUXBOX_VERSION = 1.3.2
>   FLUXBOX_SOURCE = fluxbox-$(FLUXBOX_VERSION).tar.bz2
>   FLUXBOX_SITE = http://downloads.sourceforge.net/project/fluxbox/fluxbox/$(FLUXBOX_VERSION)
> +FLUXBOX_LICENSE = as-is
> +FLUXBOX_LICENSE_FILES = COPYING
> +

  It's a MIT license.


  Regards,
  Arnout

>   FLUXBOX_AUTORECONF = YES
>   FLUXBOX_CONF_OPT = --x-includes=$(STAGING_DIR)/usr/include/X11 \
>   		   --x-libraries=$(STAGING_DIR)/usr/lib \

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
