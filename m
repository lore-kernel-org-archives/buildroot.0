From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 26 Jul 2009 15:20:46 +0200
Subject: [Buildroot] [PATCH] Fix naming mismatch between directfb and
	kernel on "fusion" version numbers
In-Reply-To: <4A6C2534.3000503@atmel.com> (Ulf Samuelsson's message of "Sun\,
	26 Jul 2009 11\:43\:16 +0200")
References: <4A6BE6A8.9080400@atmel.com> <87k51vsxz0.fsf@macbook.be.48ers.dk>
	<4A6C2534.3000503@atmel.com>
Message-ID: <874oszshqp.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Ulf" == Ulf Samuelsson <ulf.samuelsson@atmel.com> writes:

Hi,

 >> But aren't those kernel modules part of directfb? If not, does
 >> stuff actually work (not just build) if you workaround this
 >> version incompatibility? Wouldn't it make more sense to fix where
 >> the define is set in the first place? Have you sent this by the
 >> directfb developers?
 >> 
 Ulf> As far as I see, the major/minor version numbers provided
 Ulf> are the same as requested, but the naming is different.

OK, what driver / setup exactly? Isn't the problem just that we need
to bump the linux-fusion package version?

-- 
Bye, Peter Korsgaard
