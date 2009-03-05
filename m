From: Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com>
Date: Thu, 05 Mar 2009 16:30:42 +0100
Subject: [Buildroot] svn commit: trunk/buildroot/package: fuse
 lzma	netkitbase qtopia4
In-Reply-To: <87vdqodmje.fsf@macbook.be.48ers.dk>
References: <20090305141755.ED5BC7626F@busybox.osuosl.org>	<49AFE41E.2060605@atmel.com>
	<874oy8f2qm.fsf@macbook.be.48ers.dk>	<49AFE922.2060109@atmel.com>
	<87vdqodmje.fsf@macbook.be.48ers.dk>
Message-ID: <49AFF022.3060404@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter Korsgaard wrote:
>>>>>> "Hans-Christian" == Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com> writes:
> 
>  >> So how did that work with the select BR2_PTHREADS_NATIVE?
>  >> 
> 
>  Hans-Christian> Probably because I did not compile qtopia4 from
>  Hans-Christian> mainstream trunk after that select was introduced.
> 
> Really?
> 
> Author: aldot <aldot@69ca8d6d-28ef-0310-b511-8ec308f3f277>
> Date:   Wed Dec 13 19:59:07 2006 +0000
> 
>     - Thomas Lundquist added qtopia4 support. Untested.
> 
>     git-svn-id: svn+ssh://uclibc.org/svn/trunk/buildroot at 16904
> 
> +config BR2_PACKAGE_QTOPIA4
> +       bool "qtopia4"
> +       default n
> +       select BR2_INSTALL_LIBSTDCPP
> +       select BR2_PTHREADS_NATIVE
> +       select BR2_PACKAGE_JPEG
> 
> E.G. it has always been like that.
> 

I have no idea what have happened, but the select does not trigger...

~ > grep NATIVE .config
# BR2_PTHREADS_NATIVE is not set

~ > grep NATIVE toolchain_build_avr32/uClibc-0.9.30/.config
~ >

-- 
Best regards,
Hans-Christian Egtvedt
