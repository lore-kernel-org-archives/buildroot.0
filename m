From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 22 Feb 2010 20:21:40 +0100
Subject: [Buildroot] [PATCH 12/16] libpng: enable compilation on the host
In-Reply-To: <87k4u5i7ld.fsf@macbook.be.48ers.dk>
References: <cover.1266691382.git.thomas.petazzoni@free-electrons.com>
	<cover.1266691382.git.thomas.petazzoni@free-electrons.com>
	<8e8a4ee518b84a7e5f16764022ea2cf8ba455627.1266691382.git.thomas.petazzoni@free-electrons.com>
	<87k4u5i7ld.fsf@macbook.be.48ers.dk>
Message-ID: <20100222202140.1c470356@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 22 Feb 2010 17:00:14 +0100
Peter Korsgaard <jacmet@uclibc.org> wrote:

>  Thomas>  LIBPNG_CONF_OPT = --without-libpng-compat
>  Thomas>  LIBPNG_DEPENDENCIES = host-pkg-config zlib
>  
>  Thomas> +HOST_LIBPNG_CONF_OPT = --without-libpng-compat
>  Thomas> +HOST_LIBPNG_DEPENDENCIES = host-zlib
>  Thomas> +
> 
> What about host-pkg-config?

Right, you're correct.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
