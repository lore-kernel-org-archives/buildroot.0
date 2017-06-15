From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 15 Jun 2017 23:13:52 +0200
Subject: [Buildroot] [PATCH v4 6/7] package/python-ipython: Add
 dependecy list
In-Reply-To: <20170612234216.902-7-andrew.smirnov@gmail.com>
References: <20170612234216.902-1-andrew.smirnov@gmail.com>
 <20170612234216.902-7-andrew.smirnov@gmail.com>
Message-ID: <20170615231352.6735102d@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 12 Jun 2017 16:42:15 -0700, Andrey Smirnov wrote:

>  config BR2_PACKAGE_PYTHON_IPYTHON
>  	bool "python-ipython"
> +	select BR2_PACKAGE_PYTHON_PEXPECT # runtime
> +	select BR2_PACKAGE_PYTHON_PATHLIB2 if BR2_PACKAGE_PYTHON  # runtime
> +	select BR2_PACKAGE_PYTHON_BACKPORTS_SHUTIL_GET_TERMINAL_SIZE if BR2_PACKAGE_PYTHON  # runtime
> +	select BR2_PACKAGE_PYTHON_TRAITLETS  # runtime
> +	select BR2_PACKAGE_PYTHON_SIMPLEGENERIC  # runtime
> +	select BR2_PACKAGE_PYTHON_PYGMENTS  # runtime
> +	select BR2_PACKAGE_PYTHON_PROMPT_TOOLKIT # runtime
> +	select BR2_PACKAGE_PYTHON_PICKLESHARE # runtime
> +	select BR2_PACKAGE_PYTHON_DECORATOR # runtime

Alphabetic sorting is better, so I've fixed this when applying.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
