From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 09 Oct 2013 18:33:54 +0200
Subject: [Buildroot] [PATCH 2 of 5] libnetfilter_cthelper: correct
 license GPLv2 -> GPLv2+
In-Reply-To: <56cca55a76b3065d1555.1381319910@argentina>
References: <patchbomb.1381319908@argentina>
 <56cca55a76b3065d1555.1381319910@argentina>
Message-ID: <52558572.7070101@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 10/09/13 13:58, Thomas De Schampheleire wrote:
> The main file of this package is src/libnetfilter_cthelper.c, which states
> GPLv2+.
>
> Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

>
> ---
>   package/libnetfilter_cthelper/libnetfilter-cthelper.mk |  2 +-
>   1 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/package/libnetfilter_cthelper/libnetfilter-cthelper.mk b/package/libnetfilter_cthelper/libnetfilter-cthelper.mk
> --- a/package/libnetfilter_cthelper/libnetfilter-cthelper.mk
> +++ b/package/libnetfilter_cthelper/libnetfilter-cthelper.mk
> @@ -10,7 +10,7 @@ LIBNETFILTER_CTHELPER_SITE = http://www.
>   LIBNETFILTER_CTHELPER_INSTALL_STAGING = YES
>   LIBNETFILTER_CTHELPER_DEPENDENCIES = host-pkgconf libmnl
>   LIBNETFILTER_CTHELPER_AUTORECONF = YES
> -LIBNETFILTER_CTHELPER_LICENSE = GPLv2
> +LIBNETFILTER_CTHELPER_LICENSE = GPLv2+
>   LIBNETFILTER_CTHELPER_LICENSE_FILES = COPYING
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
