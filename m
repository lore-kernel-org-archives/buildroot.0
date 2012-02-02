From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 02 Feb 2012 16:56:25 +0100
Subject: [Buildroot] [git commit] boot: only show vendor-specific
	bootloaders for applicable arm variant
In-Reply-To: <20120202164743.30dfab12@skate> (Thomas Petazzoni's message of
 "Thu, 2 Feb 2012 16:47:43 +0100")
References: <20120201224701.C13259097B@busybox.osuosl.org>
 <20120202164743.30dfab12@skate>
Message-ID: <87ipjp9ql2.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 >> Atmel at91sam9 and NXP lpc32xx are both all arm926t, so only show
 >> then if that arm variant is selected.

 Thomas> Technically this is correct, but I am pretty sure a lot of
 Thomas> people keep the default "generic_arm" and therefore would not
 Thomas> see the availability of AT91Bootstrap or the LPC bootloaders.

 Thomas> For example, if you use a CodeSourcery external toolchain,
 Thomas> there is basically no difference between generic_arm and
 Thomas> arm926t, because the toolchain already defaults to armv5t.

True. Is that a common use case? If so then I'll revert.

-- 
Bye, Peter Korsgaard
