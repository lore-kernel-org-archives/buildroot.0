From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 26 Oct 2008 21:02:26 +0100
Subject: [Buildroot] [PATCH] libglib2: remove $(DISABLE_NLS) from
	configure options
In-Reply-To: <200810250216.21072.markus.heidelberg@web.de> (Markus
	Heidelberg's message of "Sat\, 25 Oct 2008 02\:16\:20 +0200")
References: <200810250216.21072.markus.heidelberg@web.de>
Message-ID: <87fxmjdt0t.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Markus" == Markus Heidelberg <markus.heidelberg@web.de> writes:

 Markus> The configure option --disable-nls is not supported anymore in glib
 Markus> since version 2.0, see file ChangeLog.pre-2-0 line 544.

Thanks, committed.

Does this mean that libglib2 should depend on BR2_ENABLE_LOCALE?

-- 
Bye, Peter Korsgaard
