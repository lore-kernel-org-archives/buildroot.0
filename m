From: Bernd Kuhls <berndkuhls@hotmail.com>
Date: Mon, 30 Dec 2013 18:37:05 +0100
Subject: [Buildroot] [PATCH 1/1] libdrm: bump to version 2.4.50
Message-ID: <BLU0-SMTP198AF3F5E0B3969DC570633D9CE0@phx.gbl>
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
index f5efaf1..0db4c81 100644
--- a/package/libdrm/libdrm.mk
+++ b/package/libdrm/libdrm.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBDRM_VERSION = 2.4.46
+LIBDRM_VERSION = 2.4.50
 LIBDRM_SOURCE = libdrm-$(LIBDRM_VERSION).tar.bz2
 LIBDRM_SITE = http://dri.freedesktop.org/libdrm/
 LIBDRM_LICENSE = MIT
-- 
1.7.9.5
