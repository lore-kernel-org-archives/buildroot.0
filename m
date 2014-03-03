From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 3 Mar 2014 22:04:17 +0100
Subject: [Buildroot] [PATCH 1/1] pyrex: new package
In-Reply-To: <1379700560-10738-1-git-send-email-mlweber1@rockwellcollins.com>
References: <1379700560-10738-1-git-send-email-mlweber1@rockwellcollins.com>
Message-ID: <20140303220417.6835ec44@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Matt Weber,

On Fri, 20 Sep 2013 13:09:20 -0500, Matt Weber wrote:

> index 0000000..551c15c
> --- /dev/null
> +++ b/package/python-pyrex/Config.in
> @@ -0,0 +1,7 @@
> +config BR2_PACKAGE_PYTHON_PYREX
> +	bool "pyrex"
> +	depends on BR2_PACKAGE_PYTHON
> +	help
> +	  Pyrex is a language for writing Python extension modules
> +
> +	  http://www.cosc.canterbury.ac.nz/greg.ewing/python/Pyrex/

If I understand correctly what Pyrex is, it is a tool that generates C
code that then needs to be compiled with gcc. At least that's what I
understand from http://ldots.org/pyrex-guide/2-compiling.html.

Therefore, I am wondering how useful it is to support the installation
of python-pyrex to the target, while we don't have the support for
providing a compiler on the target.

Is there something I have missed about Pyrex?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
