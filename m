From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 10 Aug 2018 00:12:19 +0200
Subject: [Buildroot] [PATCH] busybox: bump version to 1.29.2
Message-ID: <20180809221219.1838-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Includes fixes for fdisk (compat fixes, allow 2TB+ sizes), gzip
(FEATURE_GZIP_LEVELS was producing badly-compressed .gz), hexedit (segfault
fix).

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/busybox/busybox.hash | 4 ++--
 package/busybox/busybox.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/busybox/busybox.hash b/package/busybox/busybox.hash
index 11b9565df9..dc7c5613f8 100644
--- a/package/busybox/busybox.hash
+++ b/package/busybox/busybox.hash
@@ -1,3 +1,3 @@
-# From https://busybox.net/downloads/busybox-1.29.1.tar.bz2.sha256
-sha256 fc250730ea16d28839bfecda3c431683fa6bd4273ffca6b632cbeb3556c914c3  busybox-1.29.1.tar.bz2
+# From https://busybox.net/downloads/busybox-1.29.2.tar.bz2.sha256
+sha256 67d2fa6e147a45875fe972de62d907ef866fe784c495c363bf34756c444a5d61  busybox-1.29.2.tar.bz2
 sha256 bbfc9843646d483c334664f651c208b9839626891d8f17604db2146962f43548  LICENSE
diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index 3be6cbc7b1..ab0930a7fc 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BUSYBOX_VERSION = 1.29.1
+BUSYBOX_VERSION = 1.29.2
 BUSYBOX_SITE = http://www.busybox.net/downloads
 BUSYBOX_SOURCE = busybox-$(BUSYBOX_VERSION).tar.bz2
 BUSYBOX_LICENSE = GPL-2.0
-- 
2.11.0
