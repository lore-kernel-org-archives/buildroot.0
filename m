From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 21 Feb 2011 23:31:38 +0100
Subject: [Buildroot] [PATCH] Resubmit Strange behavior of inittab
In-Reply-To: <9AC3F0E75060224C8BBC5BA2DDC8853A1F199844@EXV1.corp.adtran.com>
	(ANDY KENNEDY's message of "Thu, 27 Jan 2011 12:10:46 -0600")
References: <9AC3F0E75060224C8BBC5BA2DDC8853A1EF91EB1@EXV1.corp.adtran.com>
	<1295373920.16414.126.camel@worky>
	<9AC3F0E75060224C8BBC5BA2DDC8853A1F199844@EXV1.corp.adtran.com>
Message-ID: <874o7xqat1.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "ANDY" == ANDY KENNEDY <ANDY.KENNEDY@adtran.com> writes:

 ANDY> inittab ordering causes mount to fail on remount,rw.  inittab
 ANDY> changed to mount /proc first.

Committed, thanks - Sorry for the slow response.

-- 
Bye, Peter Korsgaard
