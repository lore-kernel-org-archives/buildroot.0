From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 26 Oct 2019 20:51:21 +0200
Subject: [Buildroot] [git commit] package/busybox: bump version to 1.31.1
Message-ID: <20191026184456.91EF37F8C5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5530674e0ce21a927735ff77602a9e5854363751
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/busybox/busybox.hash | 5 +++--
 package/busybox/busybox.mk   | 2 +-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/busybox/busybox.hash b/package/busybox/busybox.hash
index 2b346e685d..e5b05ae731 100644
--- a/package/busybox/busybox.hash
+++ b/package/busybox/busybox.hash
@@ -1,3 +1,4 @@
-# From https://busybox.net/downloads/busybox-1.31.0.tar.bz2.sha256
-sha256 0e4925392fd9f3743cc517e031b68b012b24a63b0cf6c1ff03cce7bb3846cc99  busybox-1.31.0.tar.bz2
+# From https://busybox.net/downloads/busybox-1.31.1.tar.bz2.sha256
+sha256 d0f940a72f648943c1f2211e0e3117387c31d765137d92bd8284a3fb9752a998  busybox-1.31.1.tar.bz2
+# Locally computed
 sha256 bbfc9843646d483c334664f651c208b9839626891d8f17604db2146962f43548  LICENSE
diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index a154584592..680d3bc17f 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BUSYBOX_VERSION = 1.31.0
+BUSYBOX_VERSION = 1.31.1
 BUSYBOX_SITE = http://www.busybox.net/downloads
 BUSYBOX_SOURCE = busybox-$(BUSYBOX_VERSION).tar.bz2
 BUSYBOX_LICENSE = GPL-2.0
