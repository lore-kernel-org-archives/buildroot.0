From: Ulf Samuelsson <ulf@atmel.com>
Date: Thu, 26 Jul 2007 18:55:54 +0200
Subject: [Buildroot] svn
	commit:	trunk/buildroot:packagetarget/device/Atmel
In-Reply-To: <1185434977.31437.50.camel@localhost.localdomain>
References: <20070722171703.79776A4756@busybox.net>
	<46A3B766.2000808@realitydiluted.com>
	<013701c7ccb3$1a92a960$dcc4af0a@atmel.com>
	<1185428949.31437.4.camel@localhost.localdomain>
	<00a301c7cf52$61ac2cd0$dcc4af0a@atmel.com>
	<1185434977.31437.50.camel@localhost.localdomain>
Message-ID: <1185468954.5580.112.camel@elrond.sweden.atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

tor 2007-07-26 klockan 09:29 +0200 skrev Hans-Christian Egtvedt:
> On Thu, 2007-07-26 at 08:03 +0200, Ulf Samuelsson wrote:
> > > On Mon, 2007-07-23 at 00:49 +0200, Ulf Samuelsson wrote:
> > >> > ulf at uclibc.org wrote: 
> 
> <cut info about AVR32 toolchain patches>
> 
> > > Right now they are roughly 8 MB for all the tools (gcc, binutils, gdb,
> > > strace, uClibc and kernel). But this is in plain text, and they compress
> > > well.
> >

The full buildroot is about 6 MB so this is more than doubling
the download time.
At home in Stockholm with 100 Mbps Ethernet it is less of a problem,
but where I am now with 10-20 kB/s Internet access it sucks...
A prepatched toolchain which is downloaded once is a much
more attractive alternative, so this is what I am going to submit.

Best Regards
Ulf Samuelsson.
