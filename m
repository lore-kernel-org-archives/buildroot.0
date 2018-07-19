From: Samuel Mendoza-Jonas <sam@mendozajonas.com>
Date: Thu, 19 Jul 2018 13:12:36 +1000
Subject: [Buildroot] [PATCH] busybox: Update to 1.29.1
Message-ID: <20180719031236.17984-1-sam@mendozajonas.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Includes fixes to sendmail and wget.

Signed-off-by: Samuel Mendoza-Jonas <sam@mendozajonas.com>
---
 package/busybox/busybox.hash | 4 ++--
 package/busybox/busybox.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/busybox/busybox.hash b/package/busybox/busybox.hash
index 26194be3a9..11b9565df9 100644
--- a/package/busybox/busybox.hash
+++ b/package/busybox/busybox.hash
@@ -1,3 +1,3 @@
-# From https://busybox.net/downloads/busybox-1.29.0.tar.bz2.sha256
-sha256 c8115612f0be640644e7c35098766ddaac4a88b773c4c4f0e43564982f660c82  busybox-1.29.0.tar.bz2
+# From https://busybox.net/downloads/busybox-1.29.1.tar.bz2.sha256
+sha256 fc250730ea16d28839bfecda3c431683fa6bd4273ffca6b632cbeb3556c914c3  busybox-1.29.1.tar.bz2
 sha256 bbfc9843646d483c334664f651c208b9839626891d8f17604db2146962f43548  LICENSE
diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index 5266f844b6..3be6cbc7b1 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BUSYBOX_VERSION = 1.29.0
+BUSYBOX_VERSION = 1.29.1
 BUSYBOX_SITE = http://www.busybox.net/downloads
 BUSYBOX_SOURCE = busybox-$(BUSYBOX_VERSION).tar.bz2
 BUSYBOX_LICENSE = GPL-2.0
-- 
2.18.0
