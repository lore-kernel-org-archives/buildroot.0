From: Hans-Christian Egtvedt <hcegtvedt@norway.atmel.com>
Date: Thu, 26 Jul 2007 09:30:06 +0200
Subject: [Buildroot] svn
	commit:	trunk/buildroot:packagetarget/device/Atmel
In-Reply-To: <00a301c7cf52$61ac2cd0$dcc4af0a@atmel.com>
References: <20070722171703.79776A4756@busybox.net>
	<46A3B766.2000808@realitydiluted.com>
	<013701c7ccb3$1a92a960$dcc4af0a@atmel.com>
	<1185428949.31437.4.camel@localhost.localdomain>
	<00a301c7cf52$61ac2cd0$dcc4af0a@atmel.com>
Message-ID: <1185435006.31437.52.camel@localhost.localdomain>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 2007-07-26 at 08:03 +0200, Ulf Samuelsson wrote:
> > On Mon, 2007-07-23 at 00:49 +0200, Ulf Samuelsson wrote:
> >> > ulf at uclibc.org wrote: 

<cut info about AVR32 toolchain patches>

> > Right now they are roughly 8 MB for all the tools (gcc, binutils, gdb,
> > strace, uClibc and kernel). But this is in plain text, and they compress
> > well.
>
> I think that until the AVR32 support is fully integrated in the GCC, it is probably 
> just as well, downloading prepatched source instead of running autotool,
> unless you can make sure that *any* version of autotools will work.

I do not have any problems to ship Buildroot with these quite large
patches, the question is if it is appropriate. We can keep the size down
after unpacking Buildroot by bzip'ing them.

Having AVR32 support integrated in GNU toolchain will take some time.

> We can't expect a user to have a certain version of autotool, unless we 
> download and build it as part of buildroot.

Buildroot already depends on different autotools, IIRC I had to install
automake1.8 to be able to build libdaemon.

-- 
With kind regards,

Hans-Christian Egtvedt, siv.ing. (M.Sc.)
Applications Engineer - AVR32 System Solutions - Atmel Norway
-- 
Mvh
Hans-Christian Egtvedt
