From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 2 Oct 2019 22:42:25 +0200
Subject: [Buildroot] [git commit] package/dos2unix: bump to version 7.4.1
Message-ID: <20191002203707.D133988311@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=06729b4d9d30ad9f23cd333117748487712486e7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

See full changelog https://waterlan.home.xs4all.nl/dos2unix/ChangeLog

The hash of the license file is changed due to the following
modification:

-Copyright (C) 2009-2016  Erwin Waterlander
+Copyright (C) 2009-2019  Erwin Waterlander

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/dos2unix/dos2unix.hash | 6 +++---
 package/dos2unix/dos2unix.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/dos2unix/dos2unix.hash b/package/dos2unix/dos2unix.hash
index 80b739495d..41fb23429b 100644
--- a/package/dos2unix/dos2unix.hash
+++ b/package/dos2unix/dos2unix.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-# https://waterlan.home.xs4all.nl/dos2unix/dos2unix-7.4.0.tar.gz.asc
-sha256	bac765abdbd95cdd87a71989d4382c32cf3cbfeee2153f0086cb9cf18261048a	dos2unix-7.4.0.tar.gz
-sha256	49224e841621b52a72aa38d8ac895a396cd3fa1395190bdfc9252378001eb3c0	COPYING.txt
+# https://waterlan.home.xs4all.nl/dos2unix/dos2unix-7.4.1.tar.gz.asc
+sha256	1cd58a60b03ed28fa39046102a185c5e88c4f7665e1e0417c25de7f8b9f78623	dos2unix-7.4.1.tar.gz
+sha256	af32dca9450e90b9a7a0f6408da1554466382cc81960108c59512f78a666a276	COPYING.txt
diff --git a/package/dos2unix/dos2unix.mk b/package/dos2unix/dos2unix.mk
index 0522ad1671..5064b7e5bb 100644
--- a/package/dos2unix/dos2unix.mk
+++ b/package/dos2unix/dos2unix.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DOS2UNIX_VERSION = 7.4.0
+DOS2UNIX_VERSION = 7.4.1
 DOS2UNIX_SITE = http://waterlan.home.xs4all.nl/dos2unix
 DOS2UNIX_LICENSE = BSD-2-Clause
 DOS2UNIX_LICENSE_FILES = COPYING.txt
