From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 12 Feb 2009 10:22:07 +0100
Subject: [Buildroot] Buildroot 2009.02 released
Message-ID: <87skmkf1s0.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Buildroot 2009.02 is released - Go download it at:

http://buildroot.uclibc.org/downloads/buildroot-2009.02.tar.gz

or

http://buildroot.uclibc.org/downloads/buildroot-2009.02.tar.bz2

It has been a long time coming, but we finally have a stable buildroot
release. This is not to say that there won't be any bugs, but we have
done a LOT of cleanups and bugfixes these last weeks, and it's IMHO a
good baseline.

As promised earlier, we are moving to a 3 month release cycle - So
expect the first release candidate of 2009.05 some time in late April,
and the final release mid May.

This release has a lot of old package versions marked as
deprecated. During the next development cycle a lot of those ancient
versions will be removed unless there's any real reason to not use the
more current versions. In other words, now is the time to shout if you
depend on something ancient, and the newer versions aren't working.

More specifically, expect to see non-sysroot versions of GCC
disappearing (<4.2.x), gdb <6.7, uClibc <0.9.29, kernel <2.6.25,
u-boot <2008.10 and busybox <1.12.x.

Thanks to everyone contributing and testing the release candidates!

-- 
Bye, Peter Korsgaard
