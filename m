From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 26 Jan 2009 13:17:44 +0100
Subject: [Buildroot] svn commit: trunk/buildroot/package: argus bind
	dmraid kismet libeXosip2 ltra etc...
In-Reply-To: <1232968874.2298.60.camel@elrond.atmel.com> (Ulf Samuelsson's
	message of "Mon\, 26 Jan 2009 12\:21\:14 +0100")
References: <20090126003405.2EE7776D28@busybox.osuosl.org>
	<873af6d219.fsf@macbook.be.48ers.dk>
	<1232968874.2298.60.camel@elrond.atmel.com>
Message-ID: <87eiyq9s7r.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Ulf" == Ulf Samuelsson <ulf.samuelsson@atmel.com> writes:


 Ulf> Most of these indicate "Machine not recognized"

From configure? Isn't that solved by the $(CONFIG_UPDATE) stuff?

 Ulf> I think one of them indicated something similar
 Ulf> to "header"-<ARCH>.h not found.

 Ulf> I consider them as totally broken for AVR32 until proven otherwise.
 Ulf> I would prefer them to depend on !BR2_avr32 in the distribution
 Ulf> (not the svn), but that is apparently not popular.

 Ulf> Totally meaninless to even attempt to build a package
 Ulf> if there is 0% of success.

Agree.

 Ulf> HCE wants it to be there in the hope of that someone will
 Ulf> need the support on AVR32 so much that they will fix it,
 Ulf> but the casual user should not include them and fail the build.

I agree, I just questioned the need for avr32 specific fixups (besides
an updated config.{guess,sub} in those packages that mostly don't seem
to be very hw specific.

HcE: Is the package list correct?

-- 
Bye, Peter Korsgaard
