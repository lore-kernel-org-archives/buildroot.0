From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 29 Apr 2009 11:38:05 +0200
Subject: [Buildroot] Buildroot 2009.02 released
In-Reply-To: <87skmkf1s0.fsf@macbook.be.48ers.dk> (Peter Korsgaard's message
	of "Thu\, 12 Feb 2009 10\:22\:07 +0100")
References: <87skmkf1s0.fsf@macbook.be.48ers.dk>
Message-ID: <873abrer5u.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <jacmet@uclibc.org> writes:

Hi,

 Peter> As promised earlier, we are moving to a 3 month release cycle
 Peter> - So expect the first release candidate of 2009.05 some time
 Peter> in late April, and the final release mid May.

 Peter> This release has a lot of old package versions marked as
 Peter> deprecated. During the next development cycle a lot of those
 Peter> ancient versions will be removed unless there's any real
 Peter> reason to not use the more current versions. In other words,
 Peter> now is the time to shout if you depend on something ancient,
 Peter> and the newer versions aren't working.

 Peter> More specifically, expect to see non-sysroot versions of GCC
 Peter> disappearing (<4.2.x), gdb <6.7, uClibc <0.9.29, kernel
 Peter> <2.6.25, u-boot <2008.10 and busybox <1.12.x.

I plan to release 2009.05-rc1 this coming weekend, so if you have any
new features that you would like to see in the release, NOW is the
time to post them / remind me. After the release candidate I'll only
look@patches fixing problems so we can stabilize the tree for a
release mid May.

-- 
Bye, Peter Korsgaard
