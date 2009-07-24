From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 24 Jul 2009 15:09:12 +0200
Subject: [Buildroot] Write Access to buildroot?
In-Reply-To: <4A69741A.8010903@atmel.com> (Ulf Samuelsson's message of "Fri\,
	24 Jul 2009 10\:43\:06 +0200")
References: <4A689265.6030308@atmel.com> <87skgmwm6h.fsf@macbook.be.48ers.dk>
	<4A69741A.8010903@atmel.com>
Message-ID: <87vdliut1j.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Ulf" == Ulf Samuelsson <ulf.samuelsson@atmel.com> writes:

Hi,

 Ulf> Personally, I think it would make sense to have
 Ulf> a development git with personal branches with write access.

You have the possibility to put your own development tree on the
server as explained by Thomas.

 Ulf> This would complement any personal git's and would allow
 Ulf> easier testing with other people's patches.

 Ulf> The main tree, used for the release
 Ulf> could then pull changes from both the development tree
 Ulf> and the personal tree's.

 Ulf> Is there a list of maintainers?

Not an explicit list, no.

 Ulf> The target/device/Atmel tree will need to be updated due to the
 Ulf> SAM9G10/G45/M10/M11.

You are probably in the best position to do this - Last I looked the
G45 wasn't publicly announced and no documentation available.

Patches are welcome.

 Ulf> The target/linux tree is also in need of maintenance.

What exactly do you mean? 2.6.31-rcX options?

-- 
Bye, Peter Korsgaard
