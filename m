From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 10 Mar 2008 21:33:59 +0100
Subject: [Buildroot] svn commit: trunk/buildroot:  package
In-Reply-To: <007c01c882ec$733d2960$080514ac@atmel.com> (Ulf Samuelsson's
	message of "Mon\, 10 Mar 2008 21\:20\:42 +0100")
References: <20080310152243.544A212C5F4@busybox.net>
	<877iga5yy6.fsf@macbook.be.48ers.dk>
	<007c01c882ec$733d2960$080514ac@atmel.com>
Message-ID: <87wsoa1fpk.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Ulf" == Ulf Samuelsson <ulf.samuelsson@atmel.com> writes:

Hi,

 Ulf> What happens if you want *some*   ".a" files in the target.
 Ulf> Didn't see the patch, just occured to me when I read this email.

Is that a realistic situation? E.G. we also only have a global switch
for man and info pages.

To me a global switch is nicer than all the per-package options we
have now (and right now, certainly not all packages have dev support).

-- 
Bye, Peter Korsgaard
