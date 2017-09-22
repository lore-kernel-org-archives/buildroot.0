From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 22 Sep 2017 23:14:08 +0200
Subject: [Buildroot] [git commit] package/openntpd: bump version to 6.2p2
Message-ID: <20170922211016.9E92080FBB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ac9dfb992761f73c201578a4ae8d1bf535180c42
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/openntpd/openntpd.hash | 4 ++--
 package/openntpd/openntpd.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/openntpd/openntpd.hash b/package/openntpd/openntpd.hash
index 7f5d3e3..1a73e8d 100644
--- a/package/openntpd/openntpd.hash
+++ b/package/openntpd/openntpd.hash
@@ -1,2 +1,2 @@
-# From http://www.openntpd.org/txt/release-6.0p1.txt
-sha256	b1ab80094788912adb12b33cb1f251cc58db39294c1b5c6376972f5f7ba577e8	openntpd-6.0p1.tar.gz
+# Locally computed
+sha256 5808a4137b008a4db20907e1a482f474734b120f254e3c5feb90db15e0820fb2  openntpd-6.2p2.tar.gz
diff --git a/package/openntpd/openntpd.mk b/package/openntpd/openntpd.mk
index 021a393..0c39ec5 100644
--- a/package/openntpd/openntpd.mk
+++ b/package/openntpd/openntpd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENNTPD_VERSION = 6.0p1
+OPENNTPD_VERSION = 6.2p2
 OPENNTPD_SITE = http://ftp.openbsd.org/pub/OpenBSD/OpenNTPD
 OPENNTPD_LICENSE = MIT-like, BSD-2-Clause, BSD-3-Clause
 OPENNTPD_LICENSE_FILES = COPYING
