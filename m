From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 01 Feb 2009 17:13:38 +0100
Subject: [Buildroot] Atmel specific handling in buildroot
In-Reply-To: <1233502594.5742.24.camel@elrond.atmel.com> (Ulf Samuelsson's
	message of "Sun\, 01 Feb 2009 16\:36\:34 +0100")
References: <873af0mvws.fsf@macbook.be.48ers.dk>
	<874ozei4hg.fsf@macbook.be.48ers.dk>
	<1233502594.5742.24.camel@elrond.atmel.com>
Message-ID: <87zlh6gmod.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Ulf" == Ulf Samuelsson <ulf.samuelsson@atmel.com> writes:

 Ulf> There are several things here

 Ulf> 1) If there is an architecture patch available for an architecture,
 Ulf>    then it should have default yes.
 Ulf>    I can't think of a situation where you prefer not to apply
 Ulf>    the architecture patch for the AT91 or AVR32.
 Ulf>    The only reason is that you are building a kernel for where
 Ulf>    there is no valid patch.
 Ulf>    If there is no architecture patch, then obviously 
 Ulf>    it should be default no.

Ok, but that's only one of the settings, so you're fine with me fixing
the COPYTO / kernel type thingies?

-- 
Bye, Peter Korsgaard
