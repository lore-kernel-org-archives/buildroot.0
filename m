From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 14 Nov 2008 14:03:31 +0100
Subject: [Buildroot] [PATCH] libogg: convert to Makefile.autotools.in
In-Reply-To: <200811140849.18874.markus.heidelberg@web.de> (Markus
	Heidelberg's message of "Fri\, 14 Nov 2008 08\:49\:18 +0100")
References: <200811140849.18874.markus.heidelberg@web.de>
Message-ID: <878wrmmpcs.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Markus" == Markus Heidelberg <markus.heidelberg@web.de> writes:

 Markus> Also remove --enable-shared and --enable-static as it's default
 Markus> and --disable-oggtest and $(DISABLE_NLS) as they are not supported.

Thanks, committed as r24040.

-- 
Bye, Peter Korsgaard
