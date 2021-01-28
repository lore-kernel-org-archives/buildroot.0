From: Adrian Perez de Castro <aperez@igalia.com>
Date: Thu, 28 Jan 2021 22:24:08 +0200
Subject: [Buildroot] [PATCH 1/1] package/webkitgtk: add
 WEBKITGTK_CPE_ID_VENDOR
In-Reply-To: <20210128171947.4137710-1-fontaine.fabrice@gmail.com>
References: <20210128171947.4137710-1-fontaine.fabrice@gmail.com>
Message-ID: <20210128222408.GB160606@momiji>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 28 Jan 2021 18:19:47 +0100 Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:
> cpe:2.3:a:webkitgtk:webkitgtk is a valid CPE identifier for this
> package:
> 
>   https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Awebkitgtk%3Awebkitgtk
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Reviewed-by: Adrian Perez de Castro <aperez@igalia.com>

> ---
>  package/webkitgtk/webkitgtk.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/webkitgtk/webkitgtk.mk b/package/webkitgtk/webkitgtk.mk
> index 73111d383a..fbb082f51f 100644
> --- a/package/webkitgtk/webkitgtk.mk
> +++ b/package/webkitgtk/webkitgtk.mk
> @@ -12,6 +12,7 @@ WEBKITGTK_LICENSE = LGPL-2.1+, BSD-2-Clause
>  WEBKITGTK_LICENSE_FILES = \
>  	Source/WebCore/LICENSE-APPLE \
>  	Source/WebCore/LICENSE-LGPL-2.1
> +WEBKITGTK_CPE_ID_VENDOR = webkitgtk
>  WEBKITGTK_DEPENDENCIES = host-ruby host-python host-gperf \
>  	enchant harfbuzz icu jpeg libgcrypt libgtk3 libsecret libsoup \
>  	libtasn1 libxml2 libxslt openjpeg sqlite webp woff2
> -- 
> 2.29.2
> 
-------------- next part --------------
A non-text attachment was scrubbed...
Name: not available
Type: application/pgp-signature
Size: 195 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20210128/b24e2279/attachment.asc>
