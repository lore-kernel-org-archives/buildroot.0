From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 09 Oct 2013 18:39:02 +0200
Subject: [Buildroot] [PATCH 5 of 5] libnetfilter_log: correct license
 GPLv2 -> GPLv2+
In-Reply-To: <ccb40b35e63386f0d9df.1381319913@argentina>
References: <patchbomb.1381319908@argentina>
 <ccb40b35e63386f0d9df.1381319913@argentina>
Message-ID: <525586A6.9020407@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 10/09/13 13:58, Thomas De Schampheleire wrote:
> Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

>
> ---
>   package/libnetfilter_log/libnetfilter-log.mk |  2 +-
>   1 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/package/libnetfilter_log/libnetfilter-log.mk b/package/libnetfilter_log/libnetfilter-log.mk
> --- a/package/libnetfilter_log/libnetfilter-log.mk
> +++ b/package/libnetfilter_log/libnetfilter-log.mk
> @@ -10,7 +10,7 @@ LIBNETFILTER_LOG_SITE = http://www.netfi
>   LIBNETFILTER_LOG_INSTALL_STAGING = YES
>   LIBNETFILTER_LOG_DEPENDENCIES = host-pkgconf libnfnetlink
>   LIBNETFILTER_LOG_AUTORECONF = YES
> -LIBNETFILTER_LOG_LICENSE = GPLv2
> +LIBNETFILTER_LOG_LICENSE = GPLv2+
>   LIBNETFILTER_LOG_LICENSE_FILES = COPYING
>
>   $(eval $(autotools-package))
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
