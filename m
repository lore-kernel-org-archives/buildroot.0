From: Bernd Kuhls <berndkuhls@hotmail.com>
Date: Wed, 8 Jan 2014 22:30:57 +0100
Subject: [Buildroot] [PATCH 3/3] libdrm: bump to version 2.4.51
Message-ID: <BLU0-SMTP17825B248554C9C7DA4F813D9B10@phx.gbl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <berndkuhls@hotmail.com>
---
 package/libdrm/libdrm.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libdrm/libdrm.mk b/package/libdrm/libdrm.mk
index f5efaf1..c00f270 100644
--- a/package/libdrm/libdrm.mk
+++ b/package/libdrm/libdrm.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBDRM_VERSION = 2.4.46
+LIBDRM_VERSION = 2.4.51
 LIBDRM_SOURCE = libdrm-$(LIBDRM_VERSION).tar.bz2
 LIBDRM_SITE = http://dri.freedesktop.org/libdrm/
 LIBDRM_LICENSE = MIT
-- 
1.7.9.5
