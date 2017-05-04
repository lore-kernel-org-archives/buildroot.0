From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 4 May 2017 21:49:20 +0200
Subject: [Buildroot] [PATCH v2 01/10] package/python-decorator: New
 package
In-Reply-To: <20170427213340.26917-2-andrew.smirnov@gmail.com>
References: <20170427213340.26917-1-andrew.smirnov@gmail.com>
 <20170427213340.26917-2-andrew.smirnov@gmail.com>
Message-ID: <20170504214920.6bebd42b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 27 Apr 2017 14:33:31 -0700, Andrey Smirnov wrote:

>  package/Config.in                            |  1 +
>  package/python-decorator/Config.in           |  6 ++++++
>  package/python-decorator/python-decorator.mk | 13 +++++++++++++

This was missing an addition to the DEVELOPERS file.

> diff --git a/package/python-decorator/python-decorator.mk b/package/python-decorator/python-decorator.mk
> new file mode 100644
> index 0000000..fac03a3
> --- /dev/null
> +++ b/package/python-decorator/python-decorator.mk
> @@ -0,0 +1,13 @@
> +################################################################################
> +#
> +# python-decorator
> +#
> +################################################################################
> +
> +PYTHON_DECORATOR_VERSION = 4.0.11
> +PYTHON_DECORATOR_SITE = https://github.com/micheles/decorator.git
> +PYTHON_DECORATOR_SITE_METHOD = git

We prefer downloading from Pypi, so I've changed that.

Also, a hash file was missing, so I've added one.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
