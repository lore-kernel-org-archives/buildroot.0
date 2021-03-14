From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 14 Mar 2021 11:59:06 +0100
Subject: [Buildroot] [git commit] package/dos2unix: bump version to 7.4.2
Message-ID: <20210314103653.184377FB95@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=338d19044cbbef80294354db1f897b7109153e16
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- update COPYING.txt hash (update copyright year)

Changelog ([1]):

  2020-10-12: Version 7.4.2
    * New Friulian translation of the messages.
    * Updated Dutch, German, Serbian, Traditional Chinese, and Ukrainian
      translations.

[1] https://sourceforge.net/projects/dos2unix/files/dos2unix/7.4.2/

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/dos2unix/dos2unix.hash | 6 +++---
 package/dos2unix/dos2unix.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/dos2unix/dos2unix.hash b/package/dos2unix/dos2unix.hash
index 41fb23429b..493011fce4 100644
--- a/package/dos2unix/dos2unix.hash
+++ b/package/dos2unix/dos2unix.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-# https://waterlan.home.xs4all.nl/dos2unix/dos2unix-7.4.1.tar.gz.asc
-sha256	1cd58a60b03ed28fa39046102a185c5e88c4f7665e1e0417c25de7f8b9f78623	dos2unix-7.4.1.tar.gz
-sha256	af32dca9450e90b9a7a0f6408da1554466382cc81960108c59512f78a666a276	COPYING.txt
+# https://waterlan.home.xs4all.nl/dos2unix/dos2unix-7.4.2.tar.gz.asc
+sha256	6035c58df6ea2832e868b599dfa0d60ad41ca3ecc8aa27822c4b7a9789d3ae01  dos2unix-7.4.2.tar.gz
+sha256	db8888b7d1454348aca0c6ca851327245ef60e57afa8a6555761c8b95d24af77  COPYING.txt
diff --git a/package/dos2unix/dos2unix.mk b/package/dos2unix/dos2unix.mk
index 5064b7e5bb..1f3e79ec4e 100644
--- a/package/dos2unix/dos2unix.mk
+++ b/package/dos2unix/dos2unix.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DOS2UNIX_VERSION = 7.4.1
+DOS2UNIX_VERSION = 7.4.2
 DOS2UNIX_SITE = http://waterlan.home.xs4all.nl/dos2unix
 DOS2UNIX_LICENSE = BSD-2-Clause
 DOS2UNIX_LICENSE_FILES = COPYING.txt
