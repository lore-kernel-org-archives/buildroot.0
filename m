From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 26 Nov 2019 21:05:34 +0100
Subject: [Buildroot] [PATCH 1/1] package/fis: add an upstream URL to
 Config.in
In-Reply-To: <20191126144341.27186-1-mark@dibsco.co.uk>
References: <20191126144341.27186-1-mark@dibsco.co.uk>
Message-ID: <20191126210534.168608da@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 26 Nov 2019 14:43:41 +0000
Mark Corbin <mark@dibsco.co.uk> wrote:

> Add an upstream URL to the help text in Config.in. This
> addresses the 'Missing' URL status in the package stats
> web page output.
> 
> Signed-off-by: Mark Corbin <mark@dibsco.co.uk>
> ---
>  package/fis/Config.in | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/package/fis/Config.in b/package/fis/Config.in
> index c5bfbb82cc..1c6be02978 100644
> --- a/package/fis/Config.in
> +++ b/package/fis/Config.in
> @@ -2,3 +2,5 @@ config BR2_PACKAGE_FIS
>  	bool "fis"
>  	help
>  	  fis - manipulate RedBoot partition table from Linux.
> +
> +	  https://svn.chezphil.org/utils/trunk/

Just pointing to the source code itself is not that useful. Do we
really need to keep this package? It seems like some completely
outdated stuff. Who uses Redboot partition tables these days ?

In fact, maybe fconfig could also be dropped, it's Redboot related as
well.

Arnout, Peter, what do you think?

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
