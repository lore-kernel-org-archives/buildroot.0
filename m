From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 18 Jan 2009 15:22:45 +0100
Subject: [Buildroot] [PATCH resend] lsof,
	m4: use variables from BR instead of uclibc
In-Reply-To: <200901181423.43880.markus.heidelberg@web.de> (Markus
	Heidelberg's message of "Sun\, 18 Jan 2009 14\:23\:43 +0100")
References: <200901181423.43880.markus.heidelberg@web.de>
Message-ID: <871vv01yoa.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Markus" == Markus Heidelberg <markus.heidelberg@web.de> writes:

 Markus> UCLIB_HAS_.* is not defined in Buildroot space, so the
 Markus> conditions always evaluate to the same result. Use
 Markus> appropriate Buildroot variables.

Thanks, committed as r24902.

-- 
Bye, Peter Korsgaard
