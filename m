From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 20 Jan 2009 23:47:58 +0100
Subject: [Buildroot] svn commit: trunk/buildroot/package/dbus-glib
In-Reply-To: <20090120213244.B1DB2770AD@busybox.osuosl.org> (ulf@uclibc.org's
	message of "Tue\, 20 Jan 2009 21\:32\:44 +0000 \(UTC\)")
References: <20090120213244.B1DB2770AD@busybox.osuosl.org>
Message-ID: <87hc3tvbkx.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "ulf" == ulf  <ulf@uclibc.org> writes:

 ulf> Author: ulf
 ulf> Date: 2009-01-20 21:32:43 +0000 (Tue, 20 Jan 2009)
 ulf> New Revision: 24926

 ulf> Log:
 ulf> Libraries for dbus-glib are in /usr/lib, depend on expat

 ulf> -dbus-glib: uclibc pkgconfig dbus libglib2 $(TARGET_DIR)/$(DBUS_GLIB_TARGET_BINARY)
 ulf> +dbus-glib: uclibc pkgconfig dbus expat libglib2 $(TARGET_DIR)/$(DBUS_GLIB_TARGET_BINARY)

Dbus can be compiled with either expat or libxml2 support - How does
that fit with this?

-- 
Bye, Peter Korsgaard
