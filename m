From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 26 Jan 2009 10:21:19 +0100
Subject: [Buildroot] [PATCH 1/2] mplayer: add patch due to missing
	sys/timeb.h
In-Reply-To: <200901261016.09333.markus.heidelberg@web.de> (Markus
	Heidelberg's message of "Mon\, 26 Jan 2009 10\:16\:09 +0100")
References: <200901261016.09333.markus.heidelberg@web.de>
Message-ID: <878woybey8.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Markus" == Markus Heidelberg <markus.heidelberg@web.de> writes:

 Markus> This include file is only available, if uClibc is compiled with
 Markus> UCLIBC_SUSV3_LEGACY defined and ftime() is not needed in this part of
 Markus> mplayer at all.

That obviously seems correct, but I wonder why I didn't see that when
recently building mplayer?

Anyway, committed.

-- 
Bye, Peter Korsgaard
