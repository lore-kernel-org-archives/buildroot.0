From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 24 Aug 2008 10:54:39 +0200
Subject: [Buildroot] New package util-linux-ng
In-Reply-To: <20080810050649.GA26515@cbg.dyndns.org> (Steffen Schulz's message
	of "Sun\, 10 Aug 2008 07\:06\:49 +0200")
References: <20080810050649.GA26515@cbg.dyndns.org>
Message-ID: <87iqtqpzcg.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Steffen" == Steffen Schulz <pepe_ml@gmx.net> writes:

Hi,

 Steffen>   misses a file <linux/a.out.h> which is included in
 Steffen>   <a.out.h>. I think this is a bug in some other packet?

What kernel headers version are you using? There used to be a bug
where linux/a.out.h wasn't exported. I reported it and dwmw fixed it
for 2.6.26:

http://git.kernel.org/?p=linux/kernel/git/torvalds/linux-2.6.git;a=commit;h=e53d6a152793a38aa334d6f7a4850642ae45cedc

I've backported the fix to 2.6.25, so either of those should work.

 Steffen> Any comments on my fixes in #4274, #4284 and #4294?

Sorry, haven't looked at those yet, I'll take a look today.

-- 
Bye, Peter Korsgaard
