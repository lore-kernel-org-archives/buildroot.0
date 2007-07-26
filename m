From: Hans-Christian Egtvedt <hcegtvedt@norway.atmel.com>
Date: Thu, 26 Jul 2007 09:01:11 +0200
Subject: [Buildroot] svn commit:
	trunk/buildroot:	packagetarget/device/Atmel
In-Reply-To: <013701c7ccb3$1a92a960$dcc4af0a@atmel.com>
References: <20070722171703.79776A4756@busybox.net>
	<46A3B766.2000808@realitydiluted.com>
	<013701c7ccb3$1a92a960$dcc4af0a@atmel.com>
Message-ID: <1185433271.31437.30.camel@localhost.localdomain>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 2007-07-23 at 00:49 +0200, Ulf Samuelsson wrote:
> > ulf at uclibc.org wrote:

<cut adding ATMEL_MIRROR and revert>

> While it is used for target/device/Atmel files, it is also needed
> to download binutils/gcc/gdb tarballs for AVR32 architecture support.
> If it is defined in target/device/Atmel, then it is not defined during
> the toolchain build. causing this to fail.
> 
> The alternative is to submit a 7-10 MB patch+ for the buildroot tree
> with all the AVR32 architecture patches, which I thought was a bad idea.

I hope to get these patches smaller, many of them contain 90% hacking on
the automake system.

Right now they are roughly 8 MB for all the tools (gcc, binutils, gdb,
strace, uClibc and kernel). But this is in plain text, and they compress
well.

<cut location discussion>

-- 
With kind regards,

Hans-Christian Egtvedt, siv.ing. (M.Sc.)
Applications Engineer - AVR32 System Solutions - Atmel Norway
-- 
Mvh
Hans-Christian Egtvedt
