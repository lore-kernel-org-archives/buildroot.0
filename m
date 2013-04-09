From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 9 Apr 2013 20:35:11 +0200
Subject: [Buildroot] [PATCH 2/3] swig: new package
In-Reply-To: <1365532027-13639-2-git-send-email-gustavo@zacarias.com.ar>
References: <1365532027-13639-1-git-send-email-gustavo@zacarias.com.ar>
 <1365532027-13639-2-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20130409203511.459ba1c4@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Tue,  9 Apr 2013 15:27:06 -0300, Gustavo Zacarias wrote:

> +config BR2_PACKAGE_SWIG
> +	bool "swig"
> +	depends on BR2_INSTALL_LIBSTDCPP
> +	help
> +	  SWIG is a software development tool that connects programs written
> +	  in C and C++ with a variety of high-level programming languages.
> +
> +	  http://www.swig.org/

Does it make sense to support swig on the target if we are deprecating
the native toolchain on target and related development files?

Thanks,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
