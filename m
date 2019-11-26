From: Adrian Perez de Castro <aperez@igalia.com>
Date: Wed, 27 Nov 2019 00:59:08 +0200
Subject: [Buildroot] [PATCH 1/1] package/cog: add an upstream URL to
 Config.in
In-Reply-To: <20191126123456.13468-1-mark@dibsco.co.uk>
References: <20191126123456.13468-1-mark@dibsco.co.uk>
Message-ID: <20191127005908.GC642537@momiji>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 26 Nov 2019 12:34:56 +0000, Mark Corbin <mark@dibsco.co.uk> wrote:
> Add an upstream URL to the help text in Config.in. This
> addresses the 'Missing' URL status in the package stats
> web page output.

Good catch, thanks!

> Signed-off-by: Mark Corbin <mark@dibsco.co.uk>

Acked-by: Adrian Perez de Castro <aperez@igalia.com>

> ---
>  package/cog/Config.in | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/package/cog/Config.in b/package/cog/Config.in
> index 768fcefaac..b25991d4ae 100644
> --- a/package/cog/Config.in
> +++ b/package/cog/Config.in
> @@ -14,6 +14,8 @@ config BR2_PACKAGE_COG
>  	  not provide any chrome, and is suitable to be used
>  	  as a Web application container.
>  
> +	  https://github.com/Igalia/cog
> +
>  if BR2_PACKAGE_COG
>  
>  config BR2_PACKAGE_COG_PROGRAMS_HOME_URI
> -- 
> 2.20.1
> 
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 195 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20191127/218cfdef/attachment.asc>
