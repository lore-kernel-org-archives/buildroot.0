From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 28 Jan 2017 10:00:26 +0100
Subject: [Buildroot] [PATCH 1/1] package/libdrm: bump version to 2.4.75
Message-ID: <20170128090026.18375-1-bernd.kuhls@t-online.de>
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
index 96bd985e55..dc10b295f2 100644
--- a/package/libdrm/libdrm.hash
+++ b/package/libdrm/libdrm.hash
@@ -1,2 +1,2 @@
-# From https://lists.freedesktop.org/archives/dri-devel/2016-November/125379.html
-sha256 d80dd5a76c401f4c8756dcccd999c63d7e0a3bad258d96a829055cfd86ef840b  libdrm-2.4.74.tar.bz2
+# From https://lists.freedesktop.org/archives/dri-devel/2017-January/131209.html
+sha256 2d5a500eef412cc287d12268eed79d571e262d4957a2ec9258073f305985054f  libdrm-2.4.75.tar.bz2
diff --git a/package/libdrm/libdrm.mk b/package/libdrm/libdrm.mk
index 5df6c35edb..a28e789e57 100644
--- a/package/libdrm/libdrm.mk
+++ b/package/libdrm/libdrm.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBDRM_VERSION = 2.4.74
+LIBDRM_VERSION = 2.4.75
 LIBDRM_SOURCE = libdrm-$(LIBDRM_VERSION).tar.bz2
 LIBDRM_SITE = http://dri.freedesktop.org/libdrm
 LIBDRM_LICENSE = MIT
-- 
2.11.0
