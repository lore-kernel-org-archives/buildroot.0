From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 27 Oct 2008 10:13:20 +0100
Subject: [Buildroot] [PATCH] libglib2: remove $(DISABLE_NLS) from
	configure options
In-Reply-To: <200810270807.15968.markus.heidelberg@web.de> (Markus
	Heidelberg's message of "Mon\, 27 Oct 2008 08\:07\:15 +0100")
References: <200810250216.21072.markus.heidelberg@web.de>
	<87fxmjdt0t.fsf@macbook.be.48ers.dk>
	<200810270807.15968.markus.heidelberg@web.de>
Message-ID: <87ej22bdu7.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Markus" == Markus Heidelberg <markus.heidelberg@web.de> writes:

Hi,

 >> Does this mean that libglib2 should depend on BR2_ENABLE_LOCALE?

 Markus> I'm not sure. Looking at DISABLE_NLS in Makefile.in, then
 Markus> yes. I've also read a thread, saying that packages using glib
 Markus> don't have to ask for locale support but can just rely on
 Markus> having it. But I have no clue about the relationship between
 Markus> UCLIBC_HAS_LOCALE and --disable/enable-nls.

Probably it's handled with the libintl stuff when !BR2_ENABLE_LOCALE.

-- 
Bye, Peter Korsgaard
