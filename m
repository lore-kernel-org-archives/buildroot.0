From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 06 Jan 2009 16:28:36 +0100
Subject: [Buildroot] svn commit:
	trunk/buildroot/target/u-boot/2009.01-rc1
In-Reply-To: <1231255237.32308.111.camel@elrond.atmel.com> (Ulf Samuelsson's
	message of "Tue\, 06 Jan 2009 16\:20\:37 +0100")
References: <20090103000456.97D1E769FA@busybox.osuosl.org>
	<87iqosqz0z.fsf@macbook.be.48ers.dk>
	<1231255237.32308.111.camel@elrond.atmel.com>
Message-ID: <87zli4o3mj.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Ulf" == Ulf Samuelsson <ulf.samuelsson@atmel.com> writes:

 ulf> Provide factory default command to u-boot, using Buildroot variables
 >> 
 ulf> Added:
 ulf> trunk/buildroot/target/u-boot/2009.01-rc1/u-boot-2009.01-rc1-009-factory.patch
 >> 
 >> Do we really need this? What's the upstream status of it?

 Ulf> I find that this patch reduces maintenance A LOT.
 Ulf> If someone calls in with a problem loading linux,
 Ulf> then you tell them to do "factory"  and then 
 Ulf> everything is SO much easier.

But what's the difference between this command and a factory
environment variable which just erases your environment and resets the
board?

If you really need it for Atmel stuff, maybe you should keep it in the
Atmel fork?

-- 
Bye, Peter Korsgaard
