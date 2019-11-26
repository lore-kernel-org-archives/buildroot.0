From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 26 Nov 2019 16:59:05 +0100
Subject: [Buildroot] [PATCH 1/1] package/fconfig: update the upstream
 URL in Config.in
In-Reply-To: <20191126143352.26682-1-mark@dibsco.co.uk>
References: <20191126143352.26682-1-mark@dibsco.co.uk>
Message-ID: <20191126165905.1bfb2046@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 26 Nov 2019 14:33:52 +0000
Mark Corbin <mark@dibsco.co.uk> wrote:

> Update the upstream URL in the help text in Config.in. This
> addresses the 'Invalid(Err)' URL status in the package stats
> web page output.
> 
> In this case we will use http://sources.buildroot.net/ as no
> real upstream location can be found.
> 
> Signed-off-by: Mark Corbin <mark@dibsco.co.uk>
> ---
>  package/fconfig/Config.in | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/fconfig/Config.in b/package/fconfig/Config.in
> index e7dd58a84a..ee14a2102a 100644
> --- a/package/fconfig/Config.in
> +++ b/package/fconfig/Config.in
> @@ -3,4 +3,4 @@ config BR2_PACKAGE_FCONFIG
>  	help
>  	  fconfig - get/set RedBoot configuration parameters from Linux.
>  
> -	  http://andrzejekiert.ovh.org/software.html.en
> +	  http://sources.buildroot.net/fconfig/

I don't think it makes a lot of sense to point to
sources.buildroot.net, I think in such situation, we should just not
have an upstream URL.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
