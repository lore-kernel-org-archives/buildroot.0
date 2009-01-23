From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 23 Jan 2009 10:16:02 +0100
Subject: [Buildroot] svn commit:
	trunk/buildroot/target/u-boot/2009.01-rc3
In-Reply-To: <1232649458.5311.6.camel@elrond.atmel.com> (Ulf Samuelsson's
	message of "Thu\, 22 Jan 2009 19\:37\:38 +0100")
References: <20090122073913.5C9CE765E9@busybox.osuosl.org>
	<87zlhjogcu.fsf@macbook.be.48ers.dk>
	<1232649458.5311.6.camel@elrond.atmel.com>
Message-ID: <87k58mmlgt.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Ulf" == Ulf Samuelsson <ulf.samuelsson@atmel.com> writes:

 >> I don't see this either in U-Boot git or as a patch to the mailing
 >> list.

 Ulf> It is in the u-boot-avr32 git.
 Ulf> I pointed it out to Haavard, so he has asked Wolfgang
 Ulf> to pull this patch, but it is too late for 2009.01

So 2009.01 is broken on all avr32? Seems like someone forgot to do
tests.

I see that your patch is not the same as Haavard sent to wdenx,
perhaps update?

 >> 2009.01 is furthermore released, so -rcX should imho go.
 >> 

 Ulf> I am testing this very thing right now, so
 Ulf> 2009.01-rc3 will go, and 2009.01
 Ulf> will be enabled, and the patch will be moved 
 Ulf> to the correct directory.

I already did that yesterday.

-- 
Bye, Peter Korsgaard
