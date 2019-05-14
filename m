From: Adrian Perez de Castro <aperez@igalia.com>
Date: Wed, 15 May 2019 00:15:26 +0300
Subject: [Buildroot] [PATCH 1/1] package/woff2: add a comment for C++
In-Reply-To: <20190514205204.6859-1-fontaine.fabrice@gmail.com>
References: <20190514205204.6859-1-fontaine.fabrice@gmail.com>
Message-ID: <20190515001526.GB5012@momiji>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 14 May 2019 22:52:04 +0200, Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:
> woff2 depends on C++ so add a comment if C++ is not enabled
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Reviewed-by: Adrian Perez de Castro <aperez@igalia.com>

> ---
>  package/woff2/Config.in | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/package/woff2/Config.in b/package/woff2/Config.in
> index 48672570dd..d280414d4c 100644
> --- a/package/woff2/Config.in
> +++ b/package/woff2/Config.in
> @@ -7,3 +7,6 @@ config BR2_PACKAGE_WOFF2
>  	  typically used for Web fonts
>  
>  	  https://github.com/google/woff2
> +
> +comment "woff2 needs a toolchain w/ C++"
> +	depends on !BR2_INSTALL_LIBSTDCPP
> -- 
> 2.20.1
> 
-------------- next part --------------
A non-text attachment was scrubbed...
Name: not available
Type: application/pgp-signature
Size: 195 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20190515/7a6e3104/attachment.asc>
