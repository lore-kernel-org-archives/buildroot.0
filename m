From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun,  4 Aug 2019 08:19:23 +0200
Subject: [Buildroot] [PATCH 1/1] package/ddrescue: bump version to 1.24
Message-ID: <20190804061923.18211-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Added license hash and upstream sha256 hash for tarball.

Release notes:
1.23: https://lists.gnu.org/archive/html/info-gnu/2018-02/msg00004.html
1.24: https://lists.gnu.org/archive/html/info-gnu/2019-02/msg00012.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/ddrescue/ddrescue.hash | 6 ++++--
 package/ddrescue/ddrescue.mk   | 2 +-
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/package/ddrescue/ddrescue.hash b/package/ddrescue/ddrescue.hash
index bffa6153fe..ae370acbc9 100644
--- a/package/ddrescue/ddrescue.hash
+++ b/package/ddrescue/ddrescue.hash
@@ -1,2 +1,4 @@
-# From http://lists.gnu.org/archive/html/info-gnu/2017-02/msg00003.html
-sha1 df981672a612639ad0934e3fa6546a41d2feb99e ddrescue-1.22.tar.lz
+# From https://lists.gnu.org/archive/html/info-gnu/2019-02/msg00012.html
+sha256 4b5d3feede70e3657ca6b3c7844f23131851cbb6af0cecc9721500f7d7021087 ddrescue-1.24.tar.lz
+# Locally computed
+sha256 3d77c1a58fbde5ddba612d1fe09965e20a3804953eca12e8c1892298bb8a5eef  COPYING
diff --git a/package/ddrescue/ddrescue.mk b/package/ddrescue/ddrescue.mk
index b7564d5971..4e03179133 100644
--- a/package/ddrescue/ddrescue.mk
+++ b/package/ddrescue/ddrescue.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DDRESCUE_VERSION = 1.22
+DDRESCUE_VERSION = 1.24
 DDRESCUE_SOURCE = ddrescue-$(DDRESCUE_VERSION).tar.lz
 DDRESCUE_SITE = http://download.savannah.gnu.org/releases/ddrescue
 DDRESCUE_LICENSE = GPL-2.0+
-- 
2.20.1
