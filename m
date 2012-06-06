From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 6 Jun 2012 22:01:28 +0200
Subject: [Buildroot] [PATCH 03/10] toolchain-external: add Sourcery
 CodeBench SuperH 2012.03
In-Reply-To: <87obozsequ.fsf@macbook.be.48ers.dk>
References: <cover.1338732273.git.thomas.petazzoni@free-electrons.com>
 <cover.1338732273.git.thomas.petazzoni@free-electrons.com>
 <b7c10a694ccefce0047adc8e5e6d7ca2954663e3.1338732273.git.thomas.petazzoni@free-electrons.com>
 <87obozsequ.fsf@macbook.be.48ers.dk>
Message-ID: <20120606220128.12053bfc@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Mon, 04 Jun 2012 09:44:25 +0200,
Peter Korsgaard <jacmet@uclibc.org> a ?crit :

>  Thomas> +config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_SH201203
>  Thomas> +	bool "Sourcery CodeBench SH 2012.03"
>  Thomas> +	depends on BR2_sh4a || BR2_sh4aeb
>  Thomas> +	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
>  Thomas> +	select BR2_INSTALL_LIBSTDCPP
>  Thomas> +	help
>  Thomas> +	  Sourcery CodeBench toolchain for the SuperH architecture,
>  Thomas> +	  from Mentor Graphics. It uses gcc 4.5.2, binutils 2.20,
>  Thomas> +	  glibc 2.13, uClibc 0.9.30, gdb 7.2.50 and kernel headers
> 
> How does this fit with patch 10/10 where you state it uses glibc 2.15?

It fits with the "too-much-copy-paste" problem :)

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
