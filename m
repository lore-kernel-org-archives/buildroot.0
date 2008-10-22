From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 22 Oct 2008 07:19:39 +0200
Subject: [Buildroot] [PATCH] new package wizard: change bash-specific
	construct
In-Reply-To: <200810212310.17396.markus.heidelberg@web.de> (Markus
	Heidelberg's message of "Tue\, 21 Oct 2008 23\:10\:17 +0200")
References: <200810212310.17396.markus.heidelberg@web.de>
Message-ID: <87d4htp5p0.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Markus" == Markus Heidelberg <markus.heidelberg@web.de> writes:

 Markus> ${VAR//-/_} which replaces - with _ aborts with "syntax error" on a
 Markus> system where /bin/sh points to dash. Use tr therefor as already done in
 Markus> the line above rather than changing the shebang to bash.

Thanks, committed as r23761.

-- 
Bye, Peter Korsgaard
