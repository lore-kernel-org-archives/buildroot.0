From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 13 Nov 2020 11:03:01 +0100
Subject: [Buildroot] [PATCH 1/1] package/busybox: Fix hwclock for glibc
 2.31+
In-Reply-To: <7ba2b5f8-f871-2e84-fe3c-bcea0c89d5c5@linux.vnet.ibm.com> (Klaus
 Heinrich Kiwi's message of "Thu, 12 Nov 2020 19:48:55 -0300")
References: <20201112164844.18731-1-klaus@linux.vnet.ibm.com>
 <87wnyqi8x4.fsf@dell.be.48ers.dk>
 <7ba2b5f8-f871-2e84-fe3c-bcea0c89d5c5@linux.vnet.ibm.com>
Message-ID: <87d00hinfu.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Klaus" == Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com> writes:

 > On 11/12/2020 6:04 PM, Peter Korsgaard wrote:
 >>>>>>> "Klaus" == Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com> writes:
 >> > ---
 >> > +++ b/package/busybox/0003-hwclock-Fix-settimeofday-for-glibc-v2.31.patch
 >> > @@ -0,0 +1,58 @@
 >> > +From a4faa9af79c2a0f2b501c0fd507842e4966fc23b Mon Sep 17 00:00:00 2001
 >> 
 >> How did you end up with a different git hash here?

 > I took busybox tag 1_32_0, applied the patches found on buildroot/package/busybox,
 > then cherry-picked the above patch and git format-patch HEAD^

 > Guess I was being too cautious by applying the patches locally first?

That is also fine, but then use the -x option to git cherry-pick so the
original git hash is tracked.

 > At any rate, I'm sending a second version where I format-patch'ed the patch itself
 > (i.e., from busybox master), instead of applying it on top of a local 1_32_0 tree
 > along with other buildroot build-time patches.

That is not needed as I already applied this patch.

Thanks!

-- 
Bye, Peter Korsgaard
