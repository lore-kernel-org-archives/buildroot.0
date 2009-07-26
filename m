From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 26 Jul 2009 21:16:25 +0200
Subject: [Buildroot] [PATCH] Fix naming mismatch between directfb and
	kernel on "fusion" version numbers
In-Reply-To: <4A6CA921.7040807@atmel.com> (Ulf Samuelsson's message of "Sun\,
	26 Jul 2009 21\:06\:09 +0200")
References: <4A6BE6A8.9080400@atmel.com> <87k51vsxz0.fsf@macbook.be.48ers.dk>
	<4A6C2534.3000503@atmel.com> <874oszshqp.fsf@macbook.be.48ers.dk>
	<4A6CA921.7040807@atmel.com>
Message-ID: <87zlarqmpi.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Ulf" == Ulf Samuelsson <ulf.samuelsson@atmel.com> writes:

Hi,

 >> OK, what driver / setup exactly? Isn't the problem just that we need
 >> to bump the linux-fusion package version?

 Ulf> The module is 8.0 and the requirement is 8.0
 Ulf> but since they use different defines it wont work.

So why don't we just upgrade to linux-fusion-8.1.1 which has that typo
fixed instead?

-- 
Bye, Peter Korsgaard
