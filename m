From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 09 Oct 2013 18:38:08 +0200
Subject: [Buildroot] [PATCH 4 of 5] libnetfilter_queue: correct license
 GPLv2 -> GPLv2+
In-Reply-To: <1630269b240ca4b0d123.1381319912@argentina>
References: <patchbomb.1381319908@argentina>
 <1630269b240ca4b0d123.1381319912@argentina>
Message-ID: <52558670.9060304@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 10/09/13 13:58, Thomas De Schampheleire wrote:
> Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

  Note that include/libnetfilter_queue/libnetfilter_queue.h doesn't 
specify a version, but that means that any version applies according to 
the GPL.

  Regards,
  Arnout

>
> ---
>   package/libnetfilter_queue/libnetfilter-queue.mk |  2 +-
>   1 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/package/libnetfilter_queue/libnetfilter-queue.mk b/package/libnetfilter_queue/libnetfilter-queue.mk
> --- a/package/libnetfilter_queue/libnetfilter-queue.mk
> +++ b/package/libnetfilter_queue/libnetfilter-queue.mk
> @@ -10,7 +10,7 @@ LIBNETFILTER_QUEUE_SITE = http://www.net
>   LIBNETFILTER_QUEUE_INSTALL_STAGING = YES
>   LIBNETFILTER_QUEUE_DEPENDENCIES = host-pkgconf libnfnetlink libmnl
>   LIBNETFILTER_QUEUE_AUTORECONF = YES
> -LIBNETFILTER_QUEUE_LICENSE = GPLv2
> +LIBNETFILTER_QUEUE_LICENSE = GPLv2+
>   LIBNETFILTER_QUEUE_LICENSE_FILES = COPYING
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
