From: Adrian Perez de Castro <aperez@igalia.com>
Date: Sat, 18 Aug 2018 14:26:27 +0300
Subject: [Buildroot] [PATCH/next 1/1] package/libepoxy: bump version to
 1.5.2
In-Reply-To: <20180818092630.13369-1-bernd.kuhls@t-online.de>
References: <20180818092630.13369-1-bernd.kuhls@t-online.de>
Message-ID: <20180818142627.GB3203@momiji>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Patch looks good, thanks!

On Sat, 18 Aug 2018 11:26:30 +0200, Bernd Kuhls <bernd.kuhls@t-online.de> wrote:
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/libepoxy/libepoxy.hash | 4 ++--
>  package/libepoxy/libepoxy.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/libepoxy/libepoxy.hash b/package/libepoxy/libepoxy.hash
> index 654d1675fd..dd1b13487b 100644
> --- a/package/libepoxy/libepoxy.hash
> +++ b/package/libepoxy/libepoxy.hash
> @@ -1,5 +1,5 @@
> -# From ftp://ftp.gnome.org/pub/gnome/sources/libepoxy/1.5/libepoxy-1.5.0.sha256sum
> -sha256 4c94995398a6ebf691600dda2e9685a0cac261414175c2adf4645cdfab42a5d5  libepoxy-1.5.0.tar.xz
> +# From http://ftp.gnome.org/pub/gnome/sources/libepoxy/1.5/libepoxy-1.5.2.sha256sum
> +sha256 a9562386519eb3fd7f03209f279f697a8cba520d3c155d6e253c3e138beca7d8  libepoxy-1.5.2.tar.xz
>  
>  # Hashes for license files:
>  sha256 8d5144666f9c4df9bbd69b8900086d5979259152a1060421cdcc0fb9061a1c12  COPYING
> diff --git a/package/libepoxy/libepoxy.mk b/package/libepoxy/libepoxy.mk
> index b9498b17b4..b1731a22c5 100644
> --- a/package/libepoxy/libepoxy.mk
> +++ b/package/libepoxy/libepoxy.mk
> @@ -5,7 +5,7 @@
>  ################################################################################
>  
>  LIBEPOXY_VERSION_MAJOR = 1.5
> -LIBEPOXY_VERSION = $(LIBEPOXY_VERSION_MAJOR).0
> +LIBEPOXY_VERSION = $(LIBEPOXY_VERSION_MAJOR).2
>  LIBEPOXY_SITE = http://ftp.gnome.org/pub/gnome/sources/libepoxy/$(LIBEPOXY_VERSION_MAJOR)
>  LIBEPOXY_SOURCE = libepoxy-$(LIBEPOXY_VERSION).tar.xz
>  LIBEPOXY_INSTALL_STAGING = YES
> -- 
> 2.18.0
 
Reviewed-by: Adrian Perez de Castro <aperez@igalia.com>

Cheers,

-Adri?n
-------------- next part --------------
A non-text attachment was scrubbed...
Name: not available
Type: application/pgp-signature
Size: 195 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180818/eff0affd/attachment.asc>
