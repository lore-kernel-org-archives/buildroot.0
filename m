From: Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com>
Date: Fri, 30 Jan 2009 09:09:22 +0100
Subject: [Buildroot] svn commit: trunk/buildroot/target/device/Atmel:
 atstk100x
In-Reply-To: <1233252070.4147.23.camel@elrond.atmel.com>
References: <20090129093327.BD8B17741D@busybox.osuosl.org>
	<87skn2tptl.fsf@macbook.be.48ers.dk>
	<20090129104341.2d34aa8e@hcegtvedt>
	<87iqnytp51.fsf@macbook.be.48ers.dk>
	<1233252070.4147.23.camel@elrond.atmel.com>
Message-ID: <20090130090922.0b77a183@hcegtvedt>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 29 Jan 2009 19:01:10 +0100
Ulf Samuelsson <ulf.samuelsson@atmel.com> wrote:

> tor 2009-01-29 klockan 10:52 +0100 skrev Peter Korsgaard:
> > >>>>> "Hans-Christian" == Hans-Christian Egtvedt
> > >>>>> <hans-christian.egtvedt@atmel.com> writes:
> > 
> >  >> Too configs for practically the same kernel version? That
> >  >> doesn't sound right.
> >  >> 
> > 
> >  Hans-Christian> You can do "make atstk1005_defconfig" and similar
> > for Hans-Christian> most of the AVR32 boards. The defconfig in the
> > kernel Hans-Christian> is quite sane.
> > 
> > So in other words these files should go away?
> > 
> 
> These are example projects and the user is likely
> to want to do things which are specific for his/her kernel.
> 
> That is easier to do if you set buildroot to use a configuration file.
> 

Why?

make linux26-menuconfig works fine.

> If you set buildroot to use make defconfig, then the user
> has to change some other configurations in buildroot
> to allow change of configuration.
> 

Nope, see above.

> The way buildroot now works is that it will seek
> for a config version which is smaller or equal 
> to that of the current kernel.
> 
> It is probably safe to remove the 2.6.7.3
> 

Hmm, sure, did that have anything to do with the AVR32 boards?
Linux v2.6.7.3 was never official supported by AVR32.

-- 
Best regards,
Hans-Christian Egtvedt
