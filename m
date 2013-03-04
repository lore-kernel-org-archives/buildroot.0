From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 4 Mar 2013 09:22:16 +0100
Subject: [Buildroot] [PATCHv2] Added lcms2 package
In-Reply-To: <1362346984-20701-1-git-send-email-olivier.schonken@gmail.com>
References: <20130303171102.20719854@skate>
 <1362346984-20701-1-git-send-email-olivier.schonken@gmail.com>
Message-ID: <20130304092216.7d71ea75@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Olivier Schonken,

On Sun,  3 Mar 2013 23:43:04 +0200, Olivier Schonken wrote:
> Little CMS intends to be an OPEN SOURCE small-footprint color management engine,
> with special focus on accuracy and performance.
> 
> Signed-off-by: Olivier Schonken <olivier.schonken@gmail.com>

Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 (visual inspection only).

I have only one very minor nit, that I think doesn't prevent the patch
from being applied.

> diff --git a/package/lcms2/Config.in b/package/lcms2/Config.in
> new file mode 100644
> index 0000000..d648d24
> --- /dev/null
> +++ b/package/lcms2/Config.in
> @@ -0,0 +1,12 @@
> +config BR2_PACKAGE_LCMS2
> +	bool "lcms2"
> +	help
> +	  Little Color Management Software
> +	  Little CMS intends to be an OPEN SOURCE small-footprint color 
> +	  management engine, with special focus on accuracy and performance. 
> +	  It uses the International Color Consortium standard (ICC), which is
> +	  the modern standard when regarding to color management.
> +
> +	  http://www.littlecms.com/
> +
> +

One two many empty newline.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
