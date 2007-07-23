From: Ulf Samuelsson <ulf@atmel.com>
Date: Mon, 23 Jul 2007 11:40:05 +0200
Subject: [Buildroot] svn commit: trunk/buildroot:
	packagetarget/device/Atmel
Message-ID: <00a401c7cd0d$787ff870$dcc4af0a@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

----- Original Message ----- 
From: "Ulf Samuelsson" <ulf@atmel.com>
To: "Steven J. Hill" <sjhill@realitydiluted.com>
Cc: <buildroot@uclibc.org>
Sent: Monday, July 23, 2007 8:25 AM
Subject: Re: [Buildroot] svn commit: trunk/buildroot: packagetarget/device/Atmel


> Ulf Samuelsson wrote:
>> 
>> While it is used for target/device/Atmel files, it is also needed
>> to download binutils/gcc/gdb tarballs for AVR32 architecture support.
>> If it is defined in target/device/Atmel, then it is not defined during
>> the toolchain build. causing this to fail.
>> 
> Honestly, I would rather see the directives in each of the toolchain/*/*.mk
> files. The top-level files should be kept clean of architecture/platform
> directives.
> 

It is not "architecture/platform directives", it is a *site* on Internet,
similar to BR2_SOURCEFORGE_MIRROR which
conceivably also can contain the location of a package.


==> Additionaly, ATMEL_MIRROR will (long term) be an alternative site for all packages.
        I can rename it to SOURCE_MIRROR, if that makes you happier...

Best Regards
Ulf Samuelsson
