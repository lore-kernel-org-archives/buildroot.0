From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 27 Nov 2016 11:40:23 +0100
Subject: [Buildroot] [PATCH/next 2/2] package/libdrm: bump version to 2.4.73
In-Reply-To: <20161127104023.31345-1-bernd.kuhls@t-online.de>
References: <20161127104023.31345-1-bernd.kuhls@t-online.de>
Message-ID: <20161127104023.31345-2-bernd.kuhls@t-online.de>
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
index bda054e..3131705 100644
--- a/package/libdrm/libdrm.hash
+++ b/package/libdrm/libdrm.hash
@@ -1,2 +1,2 @@
-# From https://lists.freedesktop.org/archives/dri-devel/2016-October/119998.html
-sha256	c66287ddeee5f46ea8f8880b94b80acb3bbc33ba6321d17767eef145046df9b8	libdrm-2.4.71.tar.bz2
+# From https://lists.freedesktop.org/archives/dri-devel/2016-November/123704.html
+sha256 96bfd39242fe168017d95f22e141645a35591f5902a7d98c2fa4ca8c31df5e4d  libdrm-2.4.73.tar.bz2
diff --git a/package/libdrm/libdrm.mk b/package/libdrm/libdrm.mk
index cce5023..b4e1aad 100644
--- a/package/libdrm/libdrm.mk
+++ b/package/libdrm/libdrm.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBDRM_VERSION = 2.4.71
+LIBDRM_VERSION = 2.4.73
 LIBDRM_SOURCE = libdrm-$(LIBDRM_VERSION).tar.bz2
 LIBDRM_SITE = http://dri.freedesktop.org/libdrm
 LIBDRM_LICENSE = MIT
-- 
2.10.2
