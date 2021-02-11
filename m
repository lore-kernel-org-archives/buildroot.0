From: Adrian Perez de Castro <aperez@igalia.com>
Date: Fri, 12 Feb 2021 00:35:55 +0200
Subject: [Buildroot] [PATCH 1/1] package/brotli: add BROTLI_CPE_ID_VENDOR
In-Reply-To: <20210207125737.2805368-1-fontaine.fabrice@gmail.com>
References: <20210207125737.2805368-1-fontaine.fabrice@gmail.com>
Message-ID: <20210212003555.GB21392@momiji>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 07 Feb 2021 13:57:37 +0100 Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:
> cpe:2.3:a:google:brotli is a valid CPE identifier for this package:
> 
>   https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Agoogle%3Abrotli
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Reviewed-by: Adrian Perez de Castro <aperez@igalia.com>

> ---
>  package/brotli/brotli.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/brotli/brotli.mk b/package/brotli/brotli.mk
> index 5209d3186b..43c8524c0b 100644
> --- a/package/brotli/brotli.mk
> +++ b/package/brotli/brotli.mk
> @@ -9,6 +9,7 @@ BROTLI_SOURCE = v$(BROTLI_VERSION).tar.gz
>  BROTLI_SITE = https://github.com/google/brotli/archive
>  BROTLI_LICENSE = MIT
>  BROTLI_LICENSE_FILES = LICENSE
> +BROTLI_CPE_ID_VENDOR = google
>  BROTLI_INSTALL_STAGING = YES
>  BROTLI_CONF_OPTS = \
>  	-DBROTLI_DISABLE_TESTS=ON \
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
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20210212/11907e5e/attachment.asc>
