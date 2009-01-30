From: Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com>
Date: Fri, 30 Jan 2009 10:14:40 +0100
Subject: [Buildroot] svn commit: trunk/buildroot/target/device/Atmel:
 atstk100x
In-Reply-To: <1233306322.4147.81.camel@elrond.atmel.com>
References: <20090129093327.BD8B17741D@busybox.osuosl.org>
	<87skn2tptl.fsf@macbook.be.48ers.dk>
	<20090129104341.2d34aa8e@hcegtvedt>
	<87iqnytp51.fsf@macbook.be.48ers.dk>
	<1233252070.4147.23.camel@elrond.atmel.com>
	<20090130090922.0b77a183@hcegtvedt>
	<1233306322.4147.81.camel@elrond.atmel.com>
Message-ID: <20090130101440.3ebc34e1@hcegtvedt>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 30 Jan 2009 10:05:22 +0100
Ulf Samuelsson <ulf.samuelsson@atmel.com> wrote:

> fre 2009-01-30 klockan 09:09 +0100 skrev Hans-Christian Egtvedt:
> > On Thu, 29 Jan 2009 19:01:10 +0100
> > Ulf Samuelsson <ulf.samuelsson@atmel.com> wrote:
> > 

<snipp>

> > > That is easier to do if you set buildroot to use a configuration
> > > file.
> > > 
> > 
> > Why?
> > 
> > make linux26-menuconfig works fine.
> > 
> > > If you set buildroot to use make defconfig, then the user
> > > has to change some other configurations in buildroot
> > > to allow change of configuration.
> > > 
> > 
> > Nope, see above.
> > 
> 
> Try "make linux26-update" with that configuration...
> 

Then linux26-update is broken IMHO.

-- 
Best regards,
Hans-Christian Egtvedt
