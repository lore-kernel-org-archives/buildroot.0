From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 18 Jun 2020 21:44:50 +0200
Subject: [Buildroot] [PATCH v1 3/4] package/python-gpiozero: new package
In-Reply-To: <20200613192034.10286-3-ps.report@gmx.net>
References: <20200613192034.10286-1-ps.report@gmx.net>
 <20200613192034.10286-3-ps.report@gmx.net>
Message-ID: <20200618214450.02760f5b@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 13 Jun 2020 21:20:33 +0200
Peter Seiderer <ps.report@gmx.net> wrote:

> Signed-off-by: Peter Seiderer <ps.report@gmx.net>

I've applied after doing some tweaks. See below.

> diff --git a/package/python-gpiozero/python-gpiozero.mk b/package/python-gpiozero/python-gpiozero.mk
> new file mode 100644
> index 0000000000..71d0d43bb1
> --- /dev/null
> +++ b/package/python-gpiozero/python-gpiozero.mk
> @@ -0,0 +1,13 @@
> +################################################################################
> +#
> +# python-gpiozero
> +#
> +################################################################################
> +
> +PYTHON_GPIOZERO_VERSION = v1.5.1

VERSION should have been just 1.5.1

> +PYTHON_GPIOZERO_SITE = $(call github,gpiozero,gpiozero,$(PYTHON_GPIOZERO_VERSION))
> +PYTHON_GPIOZERO_LICENSE = BSD-3-Clause 

Trailing space here.

Applied with those issues fixed. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
