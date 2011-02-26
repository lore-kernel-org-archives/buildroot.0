From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 26 Feb 2011 12:44:05 +0100
Subject: [Buildroot] Strange:  MIPS, librt, malloc
In-Reply-To: <9AC3F0E75060224C8BBC5BA2DDC8853A1F657546@EXV1.corp.adtran.com>
	(ANDY KENNEDY's message of "Fri, 25 Feb 2011 14:47:48 -0600")
References: <9AC3F0E75060224C8BBC5BA2DDC8853A1F657546@EXV1.corp.adtran.com>
Message-ID: <87lj13owai.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "ANDY" == ANDY KENNEDY <ANDY.KENNEDY@adtran.com> writes:

Hi,

 ANDY> malloc never returns and I sit in the _pthread_cleanup_push_defer()
 ANDY> while (1) loop.

 ANDY> If I remove the malloc(), I get Hello World but never return.

 ANDY> Where do I start tracking this problem down?  Anyone else have this
 ANDY> issue?

No, I haven't seen this before. It presumably is a uClibc issue - Could
you try the various uClibc versions we support and report it on the
uClibc list if it still happens with 0.9.32-rc2?

-- 
Bye, Peter Korsgaard
