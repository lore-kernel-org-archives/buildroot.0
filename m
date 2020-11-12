From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 12 Nov 2020 22:04:23 +0100
Subject: [Buildroot] [PATCH 1/1] package/busybox: Fix hwclock for glibc
 2.31+
In-Reply-To: <20201112164844.18731-1-klaus@linux.vnet.ibm.com> (Klaus Heinrich
 Kiwi's message of "Thu, 12 Nov 2020 13:48:44 -0300")
References: <20201112164844.18731-1-klaus@linux.vnet.ibm.com>
Message-ID: <87wnyqi8x4.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Klaus" == Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com> writes:

 > Pick the below patch from upstream, in order to fix
 > 'settimeofday: Invalid argument' introduced by using glibc v2.31+.
 > (busybox hasn't tagged a new version since).

 > See https://bugs.busybox.net/show_bug.cgi?id=12756 for more info.

 > ---
 >   commit 1a5d6fcbb5e606ab4acdf22afa26361a25f1d43b
 >   Author: Eddie James <eajames@linux.ibm.com>

 >       hwclock: Fix settimeofday for glibc v2.31+
 > ---
 > +++ b/package/busybox/0003-hwclock-Fix-settimeofday-for-glibc-v2.31.patch
 > @@ -0,0 +1,58 @@
 > +From a4faa9af79c2a0f2b501c0fd507842e4966fc23b Mon Sep 17 00:00:00 2001

How did you end up with a different git hash here?

Committed after fixing that, thanks.

-- 
Bye, Peter Korsgaard
