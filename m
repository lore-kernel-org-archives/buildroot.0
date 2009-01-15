From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 15 Jan 2009 09:20:33 +0100
Subject: [Buildroot] svn commit: trunk/buildroot/package/kismet
In-Reply-To: <20090114235133.4391B7697C@busybox.osuosl.org> (ulf@uclibc.org's
	message of "Wed\, 14 Jan 2009 23\:51\:33 +0000 \(UTC\)")
References: <20090114235133.4391B7697C@busybox.osuosl.org>
Message-ID: <871vv5asku.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "ulf" == ulf  <ulf@uclibc.org> writes:

 ulf> Author: ulf
 ulf> Date: 2009-01-14 23:51:32 +0000 (Wed, 14 Jan 2009)
 ulf> New Revision: 24849

 ulf> Log:
 ulf> Kismet needs dbus to build

What about dbus_glib?

Config.in has:

        select BR2_PACKAGE_NCURSES
        select BR2_PACKAGE_LIBPCAP
        select BR2_PACKAGE_DBUS
        select BR2_PACKAGE_DBUS_GLIB

-- 
Bye, Peter Korsgaard
