From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 29 Jan 2016 00:45:03 +0100
Subject: [Buildroot] [PATCH 1/1] directfb: add help text to Config.in,
 note broken URL
In-Reply-To: <1453995476-28960-1-git-send-email-yba@tkos.co.il>
References: <1453995476-28960-1-git-send-email-yba@tkos.co.il>
Message-ID: <56AAA7FF.90208@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 28-01-16 16:37, Jonathan Ben-Avraham wrote:
> Adds descriptive help text to Config.in based on content from elinux.org and
> Wikipedia. Notes that http://www.directfb.org/ has been broken for more than
> five months and suggests using http://elinux.org/DirectFB instead.
> 
> Signed-off-by: Jonathan Ben-Avraham <yba@tkos.co.il>

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 Regards,
 Arnout

> ---
>  package/directfb/Config.in | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/package/directfb/Config.in b/package/directfb/Config.in
> index 73425d3..638e4e1 100644
> --- a/package/directfb/Config.in
> +++ b/package/directfb/Config.in
> @@ -8,7 +8,13 @@ config BR2_PACKAGE_DIRECTFB
>  	select BR2_PACKAGE_FREETYPE
>  	select BR2_PACKAGE_ZLIB
>  	help
> -	  http://www.directfb.org/
> +	  DirectFB (Direct Frame Buffer) is a set of graphics APIs implemented
> +	  on top of the Linux Frame Buffer (fbdev) abstraction layer. It is an
> +	  alternative to X11 with a smaller memory footprint that still has an
> +	  integrated windowing system. As of 4 October 2015, DirectFB's website
> +	  http://www.directfb.org/ is down. See alternative site listed below.
> +
> +	  http://elinux.org/DirectFB
>  
>  if BR2_PACKAGE_DIRECTFB
>  
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
