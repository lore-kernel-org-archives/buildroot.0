From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 09 Nov 2012 14:03:14 +0100
Subject: [Buildroot] [PATCH] autoconf: add license information
In-Reply-To: <1352460965-17114-1-git-send-email-spdawson@gmail.com>
References: <1352460965-17114-1-git-send-email-spdawson@gmail.com>
Message-ID: <509CFF12.80900@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 11/09/12 12:36, spdawson at gmail.com wrote:
> From: Simon Dawson<spdawson@gmail.com>
>
> Signed-off-by: Simon Dawson<spdawson@gmail.com>
> ---
>   package/autoconf/autoconf.mk |    2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/package/autoconf/autoconf.mk b/package/autoconf/autoconf.mk
> index 0cb50db..9530ee6 100644
> --- a/package/autoconf/autoconf.mk
> +++ b/package/autoconf/autoconf.mk
> @@ -6,6 +6,8 @@
>
>   AUTOCONF_VERSION = 2.68
>   AUTOCONF_SITE = $(BR2_GNU_MIRROR)/autoconf
> +AUTOCONF_LICENSE = GPLv3+ with exceptions

  Just thought I'd give a
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
for this one, because I agree with how it's formulated here.

> +AUTOCONF_LICENSE_FILES = COPYINGv3 COPYING.EXCEPTION
>
>   AUTOCONF_CONF_ENV = EMACS="no" ac_cv_path_M4=$(HOST_DIR)/usr/bin/m4 \
>   		    ac_cv_prog_gnu_m4_gnu=no

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
