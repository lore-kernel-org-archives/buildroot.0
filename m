From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat,  9 Jan 2016 22:19:31 +0100
Subject: [Buildroot] [PATCH 1/1] package/libdrm: bump version to 2.4.66
Message-ID: <1452374371-29836-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/libdrm/libdrm.hash | 4 ++--
 package/libdrm/libdrm.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libdrm/libdrm.hash b/package/libdrm/libdrm.hash
index 95dcd7a..948c7bf 100644
--- a/package/libdrm/libdrm.hash
+++ b/package/libdrm/libdrm.hash
@@ -1,2 +1,2 @@
-# From http://lists.freedesktop.org/archives/dri-devel/2015-September/090394.html
-sha256	71960ac8bde7d710992b1bc8879935e8300a870c36bd06f22412d0447e3d96c4	libdrm-2.4.65.tar.bz2
+# From http://lists.freedesktop.org/archives/dri-devel/2015-December/097697.html
+sha256	79cb8e988749794edfb2d777b298d5292eff353bbbb71ed813589e61d2bc2d76	libdrm-2.4.66.tar.bz2
diff --git a/package/libdrm/libdrm.mk b/package/libdrm/libdrm.mk
index 8db2236..8d84beb 100644
--- a/package/libdrm/libdrm.mk
+++ b/package/libdrm/libdrm.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBDRM_VERSION = 2.4.65
+LIBDRM_VERSION = 2.4.66
 LIBDRM_SOURCE = libdrm-$(LIBDRM_VERSION).tar.bz2
 LIBDRM_SITE = http://dri.freedesktop.org/libdrm
 LIBDRM_LICENSE = MIT
-- 
2.6.4
