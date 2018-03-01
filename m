From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 1 Mar 2018 23:25:40 +0100
Subject: [Buildroot] [git commit] package/busybox: bump version to 1.28.1
Message-ID: <20180305200720.3940D81012@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=26a15ae6a63cf6c7f38775f4737fc1298dc3b671
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Added sha256 hash.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/busybox/busybox.hash | 9 +++++----
 package/busybox/busybox.mk   | 2 +-
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/busybox/busybox.hash b/package/busybox/busybox.hash
index 4ca3936ada..b7067b6633 100644
--- a/package/busybox/busybox.hash
+++ b/package/busybox/busybox.hash
@@ -1,5 +1,6 @@
-# From https://busybox.net/downloads/busybox-1.28.0.tar.bz2.sign
-md5	b119b8decda796ab5cee5478dc9c642c	busybox-1.28.0.tar.bz2
-sha1	a25e9a33e830e307c2a446ca234531049dd427f2	busybox-1.28.0.tar.bz2
-# License files, locally calculated
+# From https://busybox.net/downloads/busybox-1.28.1.tar.bz2.sign
+md5 928919a21e34d5c5507d872a4fb7b9f4  busybox-1.28.1.tar.bz2
+sha1 932e2a77c3ddaa7f0915ed6fe9232041d261f86b  busybox-1.28.1.tar.bz2
+# Locally calculated
+sha256 98fe1d3c311156c597cd5cfa7673bb377dc552b6fa20b5d3834579da3b13652e  busybox-1.28.1.tar.bz2
 sha256	bbfc9843646d483c334664f651c208b9839626891d8f17604db2146962f43548	LICENSE
diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index 73353baeda..bc0c661754 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BUSYBOX_VERSION = 1.28.0
+BUSYBOX_VERSION = 1.28.1
 BUSYBOX_SITE = http://www.busybox.net/downloads
 BUSYBOX_SOURCE = busybox-$(BUSYBOX_VERSION).tar.bz2
 BUSYBOX_LICENSE = GPL-2.0
