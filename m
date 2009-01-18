From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 18 Jan 2009 12:05:20 +0100
Subject: [Buildroot] svn commit: trunk/buildroot/package/libgtk2
In-Reply-To: <20090118105725.52A2177108@busybox.osuosl.org> (ulf@uclibc.org's
	message of "Sun\, 18 Jan 2009 10\:57\:25 +0000 \(UTC\)")
References: <20090118105725.52A2177108@busybox.osuosl.org>
Message-ID: <87ljt827tb.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "ulf" == ulf  <ulf@uclibc.org> writes:

 ulf> Author: ulf
 ulf> Date: 2009-01-18 10:57:23 +0000 (Sun, 18 Jan 2009)
 ulf> New Revision: 24900

 ulf> Log:
 ulf> Cleanup libgtk2, and prepare for 2.15

 ulf> Changeset:
 ulf> Modified: trunk/buildroot/package/libgtk2/libgtk2.mk
 ulf> ===================================================================
 ulf> --- trunk/buildroot/package/libgtk2/libgtk2.mk	2009-01-18 10:53:06 UTC (rev 24899)
 ulf> +++ trunk/buildroot/package/libgtk2/libgtk2.mk	2009-01-18 10:57:23 UTC (rev 24900)

 ulf> +# Buildroot does not support JPEG2000 library
 ulf> +ifeq ($(LIBGTK2_VERSION_MAJOR),2.15)
 ulf> +LIBGTK2_CONF_OPT += --without-libjasper
 ulf> +endif

I would prefer to leave that hunk out for now - It makes the history
easier to read if all 2.15 stuff is in the same commit.

-- 
Bye, Peter Korsgaard
