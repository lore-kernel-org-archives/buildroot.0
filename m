From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 25 Jan 2009 14:07:52 +0100
Subject: [Buildroot] 2009.02-rc2 released
In-Reply-To: <1232868757.5311.170.camel@elrond.atmel.com> (Ulf Samuelsson's
	message of "Sun\, 25 Jan 2009 08\:32\:37 +0100")
References: <3B941116898CDA489B91563DEF88F4B607F8DB@iwt-server.iwt.local>
	<1232868757.5311.170.camel@elrond.atmel.com>
Message-ID: <87zlhffs9j.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Ulf" == Ulf Samuelsson <ulf.samuelsson@atmel.com> writes:

 Ulf> s?n 2009-01-25 klockan 11:28 +1100 skrev Paul Jones:
 >> I had a go at compiling this for an ARM and I get this error:
 >> 
 >> 
 >> 
 Ulf> Noone has put a lot of effort into supporting the
 Ulf> "generic" ARM so there is no linux configuration file available.

I don't quite see how such a config would make sense in the first
place. ARM is far from as homogeneous as i386.

 Ulf> You have obviously selected Advanced Kernel configuration, and for
 Ulf> that you need Qt installed, or you have to select
 Ulf> to use "menuconfig" in the setup instead of "xconfig"

Ulf, several people (myself included) told you to default to menuconfig
for the kernel stuff, I'm surprised that's still not the case.

-- 
Bye, Peter Korsgaard
