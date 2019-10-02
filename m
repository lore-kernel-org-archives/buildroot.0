From: Pierre-Jean Texier <pjtexier@koncepto.io>
Date: Wed,  2 Oct 2019 22:29:53 +0200
Subject: [Buildroot] [PATCH] package/dos2unix: bump to version 7.4.1
Message-ID: <1570048193-21043-1-git-send-email-pjtexier@koncepto.io>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

See full changelog https://waterlan.home.xs4all.nl/dos2unix/ChangeLog

The hash of the license file is changed due to the following
modification:

-Copyright (C) 2009-2016  Erwin Waterlander
+Copyright (C) 2009-2019  Erwin Waterlander

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
---
 package/dos2unix/dos2unix.hash | 6 +++---
 package/dos2unix/dos2unix.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/dos2unix/dos2unix.hash b/package/dos2unix/dos2unix.hash
index 80b7394..41fb234 100644
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
index 0522ad1..5064b7e 100644
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
-- 
2.7.4
