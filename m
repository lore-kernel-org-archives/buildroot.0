From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 28 Feb 2009 09:51:56 +0100
Subject: [Buildroot] I want to know how the buildroot works inside when
	build and install a new package
In-Reply-To: <2ae8403e0902271849o73d3e76do4614e837ac83c55a@mail.gmail.com>
	(iamaplayer@gmail.com's message of "Sat\,
	28 Feb 2009 10\:49\:09 +0800")
References: <2ae8403e0902261945w682609fbwa4758e1bcf01f742@mail.gmail.com>
	<20090227223049.4cb8362a@surf>
	<2ae8403e0902271849o73d3e76do4614e837ac83c55a@mail.gmail.com>
Message-ID: <87myc7kkpf.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "IaMaPlAyEr" == IaMaPlAyEr  <iamaplayer@gmail.com> writes:

Hi,

 IaMaPlAyEr> I want to know how the foo.mk(the example in doc of
 IaMaPlAyEr> buildroot) pass parameter to the autotools or
 IaMaPlAyEr> ./configure, or make.

 IaMaPlAyEr> Not only just use
 IaMaPlAyEr> FOO_INSTALL_TARGET = YES
 IaMaPlAyEr> FOO_AUTORECONF=YES

 IaMaPlAyEr> but how the parameter will be used in
 IaMaPlAyEr> Makefile.autotools.in or something else?

Have a look at the top of Makefile.autotools.in, it has some
documentation of the variables.

 IaMaPlAyEr> btw, do you know the OpenWRT? It also based on buildroot,
 IaMaPlAyEr> and it has his own packages mechanism just like i2c-tools:

I'm not familiar with the fine details of how openwrt's buildroot fork
works.

-- 
Bye, Peter Korsgaard
