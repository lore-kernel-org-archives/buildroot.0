From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Date: Fri, 30 Jan 2009 10:05:22 +0100
Subject: [Buildroot] svn commit:
	trunk/buildroot/target/device/Atmel:	atstk100x
In-Reply-To: <20090130090922.0b77a183@hcegtvedt>
References: <20090129093327.BD8B17741D@busybox.osuosl.org>
	<87skn2tptl.fsf@macbook.be.48ers.dk>
	<20090129104341.2d34aa8e@hcegtvedt>
	<87iqnytp51.fsf@macbook.be.48ers.dk>
	<1233252070.4147.23.camel@elrond.atmel.com>
	<20090130090922.0b77a183@hcegtvedt>
Message-ID: <1233306322.4147.81.camel@elrond.atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

fre 2009-01-30 klockan 09:09 +0100 skrev Hans-Christian Egtvedt:
> On Thu, 29 Jan 2009 19:01:10 +0100
> Ulf Samuelsson <ulf.samuelsson@atmel.com> wrote:
> 
> > tor 2009-01-29 klockan 10:52 +0100 skrev Peter Korsgaard:
> > > >>>>> "Hans-Christian" == Hans-Christian Egtvedt
> > > >>>>> <hans-christian.egtvedt@atmel.com> writes:
> > > 
> > >  >> Too configs for practically the same kernel version? That
> > >  >> doesn't sound right.
> > >  >> 
> > > 
> > >  Hans-Christian> You can do "make atstk1005_defconfig" and similar
> > > for Hans-Christian> most of the AVR32 boards. The defconfig in the
> > > kernel Hans-Christian> is quite sane.
> > > 
> > > So in other words these files should go away?
> > > 
> > 
> > These are example projects and the user is likely
> > to want to do things which are specific for his/her kernel.
> > 
> > That is easier to do if you set buildroot to use a configuration file.
> > 
> 
> Why?
> 
> make linux26-menuconfig works fine.
> 
> > If you set buildroot to use make defconfig, then the user
> > has to change some other configurations in buildroot
> > to allow change of configuration.
> > 
> 
> Nope, see above.
> 

Try "make linux26-update" with that configuration...

BR
Ulf Samuelsson
 
> > The way buildroot now works is that it will seek
> > for a config version which is smaller or equal 
> > to that of the current kernel.
> > 
> > It is probably safe to remove the 2.6.7.3
> > 
> 
> Hmm, sure, did that have anything to do with the AVR32 boards?
> Linux v2.6.7.3 was never official supported by AVR32.
> 
