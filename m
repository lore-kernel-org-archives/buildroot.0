From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 29 Dec 2010 23:37:05 +0100
Subject: [Buildroot] [PATCH] Reset critical environment variables
In-Reply-To: <1293319782-5813-1-git-send-email-daniel.nystrom@timeterminal.se>
	("Daniel =?utf-8?Q?Nystr=C3=B6m=22's?= message of "Sun, 26 Dec 2010
	00:29:42 +0100")
References: <1293319782-5813-1-git-send-email-daniel.nystrom@timeterminal.se>
Message-ID: <87sjxgi4tq.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Daniel" == Daniel Nystr?m <daniel.nystrom@timeterminal.se> writes:

 Daniel> Reset them early in top-level Makefile to ensure they're keept unset
 Daniel> all the way through the build process.

 Daniel> This also removes the requirement of these variables being unset
 Daniel> globally prior the build.

Committed, thanks.

-- 
Bye, Peter Korsgaard
