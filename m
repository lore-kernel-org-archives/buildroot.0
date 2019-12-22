From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 22 Dec 2019 14:21:26 +0100
Subject: [Buildroot] [PATCH 1/1] package/spidev_test: update the
 upstream URL in Config.in
In-Reply-To: <20191218121634.531-1-mark@dibsco.co.uk>
References: <20191218121634.531-1-mark@dibsco.co.uk>
Message-ID: <20191222142126.3667a602@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 18 Dec 2019 12:16:34 +0000
Mark Corbin <mark@dibsco.co.uk> wrote:

> Update the upstream URL in the help text in Config.in. This
> addresses the 'Invalid(404)' URL status in the package stats
> web page output.
> 
> Signed-off-by: Mark Corbin <mark@dibsco.co.uk>
> ---
>  package/spidev_test/Config.in | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/spidev_test/Config.in b/package/spidev_test/Config.in
> index 0d8214cc29..44990c66b6 100644
> --- a/package/spidev_test/Config.in
> +++ b/package/spidev_test/Config.in
> @@ -14,4 +14,4 @@ config BR2_PACKAGE_SPIDEV_TEST
>  	  This means you won't have quad-pumped SPI support if your
>  	  toolchain is too old.
>  
> -	  https://www.kernel.org/doc/Documentation/spi/spidev_test.c
> +	  https://www.kernel.org/doc/html/latest/spi/index.html

This is not really a very useful upstream URL, but since there is
really no real upstream URL for this tool, I applied your patch as-is.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
