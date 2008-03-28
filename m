From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Date: Fri, 28 Mar 2008 23:23:25 +0100
Subject: [Buildroot] svn
	commit:trunk/buildroot:target/devicetarget/device/ARMLTD targ etc...
References: <20080328210305.9A5EF3C3B1@busybox.net>
	<007901c89119$14846510$6c01a8c0@atmel.com>
	<1206739421.3224.91.camel@nigel-x60>
	<00b101c8911b$96d0f400$6c01a8c0@atmel.com>
	<1206742318.3224.104.camel@nigel-x60>
Message-ID: <018801c89122$bc439380$6c01a8c0@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


On Fri, 2008-03-28 at 22:34 +0100, Ulf Samuelsson wrote:
> > Could you show me what I did wrong, 
> > I'm busy committing the patches now for 4.2.2.
> > 
> > Got no problem in reverting if you can show me where I messed up?
> 
> gcc-4.2.2 has not been ported to the AVR32,
> so you have obviously not built a toolchain.
> 
> Even the Atmel defconfigs for the AT91 should not be updated
> to gcc-4.2.1 before they have been tested on target H/W.
> Unless you have booted Linux, don't touch them.
> 
> Others may object to updating compiler versions
> of their targets, without testing.

Reverted. 

Let me respin my gcc patch and post it on the ML, and wait a few days
this time  ;)

-N

==> If someone wants to upgrade the compiler they can do
        so manually without changing the defconfig in the svn.

        No need to change the defconfigs until they have been tested.
        If you want to have a defconfig for your own board with gcc-4.3.0, 
        add a new board under "target/device/<yourcompany>".


Best Regards
Ulf Samuelsson
