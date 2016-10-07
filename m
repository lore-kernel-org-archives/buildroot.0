From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 7 Oct 2016 15:31:03 +0200
Subject: [Buildroot] [PATCH 2/5] package/python-futures: new package
In-Reply-To: <20161006044858.27768-2-bernd.kuhls@t-online.de>
References: <20161006044858.27768-1-bernd.kuhls@t-online.de>
 <20161006044858.27768-2-bernd.kuhls@t-online.de>
Message-ID: <20161007153103.71818a1a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu,  6 Oct 2016 06:48:55 +0200, Bernd Kuhls wrote:
> diff --git a/package/python-futures/python-futures.mk b/package/python-futures/python-futures.mk
> new file mode 100644
> index 0000000..710c2c9
> --- /dev/null
> +++ b/package/python-futures/python-futures.mk
> @@ -0,0 +1,14 @@
> +################################################################################
> +#
> +# python-futures
> +#
> +################################################################################
> +
> +PYTHON_FUTURES_VERSION = 3.0.5
> +PYTHON_FUTURES_SOURCE = futures-$(PYTHON_FUTURES_VERSION).tar.gz
> +PYTHON_FUTURES_SITE = https://pypi.python.org/packages/55/db/97c1ca37edab586a1ae03d6892b6633d8eaa23b23ac40c7e5bbc55423c78
> +PYTHON_FUTURES_SETUP_TYPE = setuptools
> +PYTHON_FUTURES_LICENSE = BSD

License is BSD-2c.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
