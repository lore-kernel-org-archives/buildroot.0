From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 25 Nov 2017 13:45:11 +0100
Subject: [Buildroot] [PATCH 1/1] python-cython: new package
In-Reply-To: <20171106203539.26391-1-joseph.kogut@gmail.com>
References: <20171106203539.26391-1-joseph.kogut@gmail.com>
Message-ID: <20171125134511.25ea518f@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon,  6 Nov 2017 12:35:39 -0800, Joseph Kogut wrote:


> diff --git a/package/python-cython/Config.in.host b/package/python-cython/Config.in.host
> new file mode 100644
> index 0000000000..69d32d5ab3
> --- /dev/null
> +++ b/package/python-cython/Config.in.host
> @@ -0,0 +1,7 @@
> +config BR2_PACKAGE_HOST_PYTHON_CYTHON
> +	bool "host python-cython"
> +	help
> +	  The Cython compiler for writing C extensions for the Python
> +	  language.
> +
> +	  http://cython.org/

Could you briefly explain the use-case for Cython, in the context of
Buildroot? How are you using it? To achieve what?

I'm just trying to understand whether it makes sense to have a visible
option in menuconfig for this package (or not).

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
