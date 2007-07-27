From: Ulf Samuelsson <ulf@atmel.com>
Date: Fri, 27 Jul 2007 10:48:25 +0200
Subject: [Buildroot] svn
	commit:	trunk/buildroot:packagetarget/device/Atmel
In-Reply-To: <1185516468.1044.48.camel@localhost.localdomain>
References: <20070722171703.79776A4756@busybox.net>
	<46A3B766.2000808@realitydiluted.com>
	<013701c7ccb3$1a92a960$dcc4af0a@atmel.com>
	<1185428949.31437.4.camel@localhost.localdomain>
	<00a301c7cf52$61ac2cd0$dcc4af0a@atmel.com>
	<1185434977.31437.50.camel@localhost.localdomain>
	<1185468954.5580.112.camel@elrond.sweden.atmel.com>
	<1185516468.1044.48.camel@localhost.localdomain>
Message-ID: <1185526105.12803.18.camel@elrond.sweden.atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

fre 2007-07-27 klockan 08:07 +0200 skrev Hans-Christian Egtvedt:
> On Thu, 2007-07-26 at 18:55 +0200, Ulf Samuelsson wrote:
> > tor 2007-07-26 klockan 09:29 +0200 skrev Hans-Christian Egtvedt:
> > > On Thu, 2007-07-26 at 08:03 +0200, Ulf Samuelsson wrote:
> > > > > On Mon, 2007-07-23 at 00:49 +0200, Ulf Samuelsson wrote:
> > > > >> > ulf at uclibc.org wrote: 
> > > 
> > > <cut info about AVR32 toolchain patches>
> > > 
> > > > > Right now they are roughly 8 MB for all the tools (gcc, binutils, gdb,
> > > > > strace, uClibc and kernel). But this is in plain text, and they compress
> > > > > well.
> > > >
> > 
> > The full buildroot is about 6 MB so this is more than doubling
> > the download time.
> > At home in Stockholm with 100 Mbps Ethernet it is less of a problem,
> > but where I am now with 10-20 kB/s Internet access it sucks...
> > A prepatched toolchain which is downloaded once is a much
> > more attractive alternative, so this is what I am going to submit.
> 
> Only problem is that we do not (yet) have a prepatched toolchain
> available on the net which is IMHO working.

Yesterday we didn't, but now there are stuff available at
$(BR2_ATMEL_MIRROR)/Source

binutils-2.17
gcc-4.1.2
gdb-6.4
uclibc-0.9.28.3

with Atmel and buildroot patches.

Plan to add AVR32 specific directories in buildroot so that new patches
can be against those prepateched versions.


> 
> When bzip'ing a 3 MB text file it usually ends up well below 500k, still
> to big though :/
> 

Best Regards
Ulf Samuelsson
