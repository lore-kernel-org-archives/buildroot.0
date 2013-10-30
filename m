From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 30 Oct 2013 15:21:58 +0000 (UTC)
Subject: [Buildroot] [Bug 6638] pkgconf doesn't download
In-Reply-To: <bug-6638-163@https.bugs.busybox.net/>
References: <bug-6638-163@https.bugs.busybox.net/>
Message-ID: <20131030152158.681A29BC28@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=6638

--- Comment #2 from masrur.macece at gmail.com 2013-10-30 15:21:58 UTC ---
Oops, error in the diff tool. Should be:
http://rabbit.dereferenced.org/~nenolod/distfiles instead of 
http://rabbitdereferenced.org/~nenolod/distfiles

--- package/pkgconf/pkgconf.mk    2013-09-17 07:42:07.000000000 -0400
+++ package/pkgconf/pkgconf.mk    2013-10-30 10:40:06.919994396 -0400
@@ -5,7 +5,7 @@

################################################################################

 PKGCONF_VERSION = 0.8.9
-PKGCONF_SITE = http://tortois.es/~nenolod/distfiles
+PKGCONF_SITE = http://rabbit.dereferenced.org/~nenolod/distfiles
 PKGCONF_SOURCE = pkgconf-$(PKGCONF_VERSION).tar.bz2
 PKGCONF_LICENSE = pkgconf license
 PKGCONF_LICENSE_FILES = COPYING

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
