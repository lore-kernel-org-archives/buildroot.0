From: Adrian Perez de Castro <aperez@igalia.com>
Date: Mon, 24 May 2021 18:10:47 +0300
Subject: [Buildroot] [PATCH] package/libepoxy: bump to version 1.5.7
In-Reply-To: <20210524144538.1983376-1-francois.perrad@gadz.org>
References: <20210524144538.1983376-1-francois.perrad@gadz.org>
Message-ID: <20210524181047.GB97068@momiji>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Fran?ois,

On Mon, 24 May 2021 16:45:38 +0200 Francois Perrad <fperrad@gmail.com> wrote:
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>

Probably we can count this as an Acked-By for
https://patchwork.ozlabs.org/project/buildroot/patch/20210519211439.1273019-1-aperez at igalia.com/
(or vice versa).

;-)

Cheers,
-Adrian

> ---
>  package/libepoxy/libepoxy.hash | 6 +++---
>  package/libepoxy/libepoxy.mk   | 2 +-
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/libepoxy/libepoxy.hash b/package/libepoxy/libepoxy.hash
> index 79876ad01..c2ff362fa 100644
> --- a/package/libepoxy/libepoxy.hash
> +++ b/package/libepoxy/libepoxy.hash
> @@ -1,5 +1,5 @@
> -# From http://ftp.gnome.org/pub/gnome/sources/libepoxy/1.5/libepoxy-1.5.5.sha256sum
> -sha256 261663db21bcc1cc232b07ea683252ee6992982276536924271535875f5b0556  libepoxy-1.5.5.tar.xz
> +# From https://ftp.gnome.org/pub/gnome/sources/libepoxy/1.5/libepoxy-1.5.7.sha256sum
> +sha256  9479cc0146ffb395fdecf9bd2a5930834fd0bce490cbcc4681ffd716bb3a0763  libepoxy-1.5.7.tar.xz
>  
>  # Hashes for license files:
> -sha256 8d5144666f9c4df9bbd69b8900086d5979259152a1060421cdcc0fb9061a1c12  COPYING
> +sha256  8d5144666f9c4df9bbd69b8900086d5979259152a1060421cdcc0fb9061a1c12  COPYING
> diff --git a/package/libepoxy/libepoxy.mk b/package/libepoxy/libepoxy.mk
> index bb578fb02..729d1bff9 100644
> --- a/package/libepoxy/libepoxy.mk
> +++ b/package/libepoxy/libepoxy.mk
> @@ -5,7 +5,7 @@
>  ################################################################################
>  
>  LIBEPOXY_VERSION_MAJOR = 1.5
> -LIBEPOXY_VERSION = $(LIBEPOXY_VERSION_MAJOR).5
> +LIBEPOXY_VERSION = $(LIBEPOXY_VERSION_MAJOR).7
>  LIBEPOXY_SITE = http://ftp.gnome.org/pub/gnome/sources/libepoxy/$(LIBEPOXY_VERSION_MAJOR)
>  LIBEPOXY_SOURCE = libepoxy-$(LIBEPOXY_VERSION).tar.xz
>  LIBEPOXY_INSTALL_STAGING = YES
> -- 
> 2.30.2
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
-------------- next part --------------
A non-text attachment was scrubbed...
Name: not available
Type: application/pgp-signature
Size: 195 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20210524/3a3a152a/attachment.asc>
