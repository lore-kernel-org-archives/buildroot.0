From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 22 Dec 2019 22:58:17 +0100
Subject: [Buildroot] [PATCH 1/1] package/perl-sys-cpu: add an upstream
 URL to Config.in
In-Reply-To: <20191217121753.14399-1-mark@dibsco.co.uk>
References: <20191217121753.14399-1-mark@dibsco.co.uk>
Message-ID: <20191222225817.491b7c31@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 17 Dec 2019 12:17:53 +0000
Mark Corbin <mark@dibsco.co.uk> wrote:

> Add an upstream URL to the help text in Config.in. This
> addresses the 'Missing' URL status in the package stats
> web page output.
> 
> Signed-off-by: Mark Corbin <mark@dibsco.co.uk>
> ---
>  package/perl-sys-cpu/Config.in | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/package/perl-sys-cpu/Config.in b/package/perl-sys-cpu/Config.in
> index 8306b371dc..70cfded8ff 100644
> --- a/package/perl-sys-cpu/Config.in
> +++ b/package/perl-sys-cpu/Config.in
> @@ -5,5 +5,7 @@ config BR2_PACKAGE_PERL_SYS_CPU
>  	  Perl module for getting information about the system CPU
>  	  (Sys::CPU).
>  
> +	  http://search.cpan.org/dist/Sys-CPU/

I've applied, but there is a high chance of this change going away the
next time this package is re-generated/updated with our scancpan
utility.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
