From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 30 Sep 2009 11:53:17 +0200
Subject: [Buildroot] [PATCH] zlib: Replace negative logic in Makefile
	with positive
In-Reply-To: <1254263763-21605-1-git-send-email-mroth@nessie.de> (Michael
	Roth's message of "Wed\, 30 Sep 2009 00\:36\:03 +0200")
References: <1254263763-21605-1-git-send-email-mroth@nessie.de>
Message-ID: <87iqf0oj1u.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Michael" == Michael Roth <mroth@nessie.de> writes:

 Michael> Positive logic is easier to read and understand than something
 Michael> like 'if not option=yes then foo else bar'.

Committed, thanks.

-- 
Bye, Peter Korsgaard
