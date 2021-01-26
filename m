From: Adrian Perez de Castro <aperez@igalia.com>
Date: Tue, 26 Jan 2021 23:28:40 +0200
Subject: [Buildroot] [PATCH 1/1] package/wpewebkit: add CPE variables
In-Reply-To: <20210126210845.2497502-1-fontaine.fabrice@gmail.com>
References: <20210126210845.2497502-1-fontaine.fabrice@gmail.com>
Message-ID: <20210126232840.GB33538@momiji>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 26 Jan 2021 22:08:45 +0100 Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:
> cpe:2.3:a:wpewebkit:wpe_webkit is a valid CPE identifier for this
> package:
> 
>   https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Awpewebkit%3Awpe_webkit
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Reviewed-by: Adrian Perez de Castro <aperez@igalia.com>

> ---
>  package/wpewebkit/wpewebkit.mk | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/package/wpewebkit/wpewebkit.mk b/package/wpewebkit/wpewebkit.mk
> index d3afdf0094..91f137d96f 100644
> --- a/package/wpewebkit/wpewebkit.mk
> +++ b/package/wpewebkit/wpewebkit.mk
> @@ -12,6 +12,8 @@ WPEWEBKIT_LICENSE = LGPL-2.1+, BSD-2-Clause
>  WPEWEBKIT_LICENSE_FILES = \
>  	Source/WebCore/LICENSE-APPLE \
>  	Source/WebCore/LICENSE-LGPL-2.1
> +WPEWEBKIT_CPE_ID_VENDOR = wpewebkit
> +WPEWEBKIT_CPE_ID_PRODUCT = wpe_webkit
>  WPEWEBKIT_DEPENDENCIES = host-gperf host-python host-ruby \
>  	harfbuzz cairo icu jpeg libepoxy libgcrypt libgles libsoup libtasn1 \
>  	libpng libxslt openjpeg wayland-protocols webp wpebackend-fdo
> -- 
> 2.29.2
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
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20210126/e5e24f54/attachment.asc>
