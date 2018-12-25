From: Adrian Perez de Castro <aperez@igalia.com>
Date: Tue, 25 Dec 2018 18:57:19 +0100
Subject: [Buildroot] [PATCH 2/2] webkitgtk: fix host dependencies
In-Reply-To: <20181225080009.25780-2-francois.perrad@gadz.org>
References: <20181225080009.25780-2-francois.perrad@gadz.org>
Message-ID: <20181225185719.GD30616@momiji>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Fran?ois,

Thanks for seding these cleanups, they look good to me.

On Tue, 25 Dec 2018 09:00:09 +0100, Francois Perrad <fperrad@gmail.com> wrote:
> python 2.7 is required by the cmake stuff.
> bison & flex are not used in the webkitgtk tree.
> 
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>

Acked-by: Adrian Perez de Castro <aperez@igalia.com>

> ---
>  package/webkitgtk/webkitgtk.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/webkitgtk/webkitgtk.mk b/package/webkitgtk/webkitgtk.mk
> index e03fd969e..80daadd15 100644
> --- a/package/webkitgtk/webkitgtk.mk
> +++ b/package/webkitgtk/webkitgtk.mk
> @@ -12,7 +12,7 @@ WEBKITGTK_LICENSE = LGPL-2.1+, BSD-2-Clause
>  WEBKITGTK_LICENSE_FILES = \
>  	Source/WebCore/LICENSE-APPLE \
>  	Source/WebCore/LICENSE-LGPL-2.1
> -WEBKITGTK_DEPENDENCIES = host-ruby host-flex host-bison host-gperf \
> +WEBKITGTK_DEPENDENCIES = host-ruby host-python host-gperf \
>  	enchant harfbuzz icu jpeg libgcrypt libgtk3 libsecret libsoup \
>  	libtasn1 libxml2 libxslt sqlite webp woff2
>  WEBKITGTK_CONF_OPTS = \
-------------- next part --------------
A non-text attachment was scrubbed...
Name: not available
Type: application/pgp-signature
Size: 195 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20181225/9f4c5606/attachment.asc>
