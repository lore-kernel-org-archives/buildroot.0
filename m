From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 03 Jun 2008 12:18:43 +0200
Subject: [Buildroot] [PATCH] fix tslib inputattach
In-Reply-To: <200806031011.23006.markus.heidelberg@web.de> (Markus
	Heidelberg's message of "Tue\, 3 Jun 2008 10\:11\:22 +0200")
References: <200806031011.23006.markus.heidelberg@web.de>
Message-ID: <87y75m6cu4.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Markus" == Markus Heidelberg <markus.heidelberg@web.de> writes:

 Markus> Hello,
 Markus> this fixes two errors in the inputattach patch for the package tslib.

Thanks, fixed. Tslib should be cleaned up to use the inputattach in
the input-tools package though.

I can do it, but I don't have hw to test tslib, Ulf?

-- 
Bye, Peter Korsgaard
