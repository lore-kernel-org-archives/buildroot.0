From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 26 Oct 2019 10:05:14 +0200
Subject: [Buildroot] [PATCH 1/1] package/acsccid: bump version to 1.1.7
Message-ID: <20191026080514.12907-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Added hashes for tarball and license file.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/acsccid/acsccid.hash | 9 ++++++---
 package/acsccid/acsccid.mk   | 2 +-
 2 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/package/acsccid/acsccid.hash b/package/acsccid/acsccid.hash
index 24d2fa735f..2d61ad6643 100644
--- a/package/acsccid/acsccid.hash
+++ b/package/acsccid/acsccid.hash
@@ -1,3 +1,6 @@
-# From https://sourceforge.net/projects/acsccid/files/acsccid/1.1.4/
-sha1 8c0b42ff79032289731916d18a2698b258dfd6a2 acsccid-1.1.4.tar.bz2
-md5 ac77b3aeae0a11723c96c7f98769490e acsccid-1.1.4.tar.bz2
+# From https://sourceforge.net/projects/acsccid/files/acsccid/1.1.7/
+sha1 f4db3c2393f392191291df128008832e245d821b acsccid-1.1.7.tar.bz2
+md5 0b34146571d9492ecfff066582dd9356 acsccid-1.1.7.tar.bz2
+# Locally computed
+sha256 3778548ff9b639dd46d1570922e425698e16c5a0a0840ed1fad235052e291ee3  acsccid-1.1.7.tar.bz2
+sha256 a9bdde5616ecdd1e980b44f360600ee8783b1f99b8cc83a2beb163a0a390e861  COPYING
diff --git a/package/acsccid/acsccid.mk b/package/acsccid/acsccid.mk
index a59a16d76f..abb25ac3be 100644
--- a/package/acsccid/acsccid.mk
+++ b/package/acsccid/acsccid.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ACSCCID_VERSION = 1.1.4
+ACSCCID_VERSION = 1.1.7
 ACSCCID_SOURCE = acsccid-$(ACSCCID_VERSION).tar.bz2
 ACSCCID_SITE = http://downloads.sourceforge.net/acsccid
 ACSCCID_LICENSE = LGPL-2.1+
-- 
2.20.1
