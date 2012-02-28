From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 28 Feb 2012 09:22:57 +0100
Subject: [Buildroot] update libglib2 and libsoup
In-Reply-To: <1330346337-27342-1-git-send-email-s.neumann@raumfeld.com> (Sven
 Neumann's message of "Mon, 27 Feb 2012 13:38:53 +0100")
References: <1330346337-27342-1-git-send-email-s.neumann@raumfeld.com>
Message-ID: <8762er2wpq.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Sven" == Sven Neumann <s.neumann@raumfeld.com> writes:

 Sven> This is a patchset that updates libglib2 and libsoup to the latest
 Sven> stable versions.

 Sven> SSL/TLS support in libsoup does not any longer use libgcrypt directly
 Sven> but relies on GIO modules that are provided by glib-networking. Thus
 Sven> a new package "glib-networking" is introduced.

 Sven> Packages using libsoup with SSL support don't need to be changed;
 Sven> the BR2_PACKAGE_LIBSOUP_SSL option takes care of selecting the new
 Sven> glib-networking package and compiling it with libgcrypt support.

 Sven> There's also a patch included for gamin that is needed to make it
 Sven> compile with the latest libglib2.

Committed series to next after fixing up glib build, thanks.

-- 
Bye, Peter Korsgaard
