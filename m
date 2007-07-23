From: Ulf Samuelsson <ulf@atmel.com>
Date: Mon, 23 Jul 2007 08:25:37 +0200
Subject: [Buildroot] svn commit: trunk/buildroot:
	packagetarget/device/Atmel
References: <20070722171703.79776A4756@busybox.net>
	<46A3B766.2000808@realitydiluted.com>
	<013701c7ccb3$1a92a960$dcc4af0a@atmel.com>
	<46A418A1.30808@realitydiluted.com>
Message-ID: <006701c7ccfe$5a670950$dcc4af0a@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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

Best Regards
Ulf Samuelsson
