From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun,  5 Jul 2020 19:09:52 -0600
Subject: [Buildroot] [PATCH 1/1] package/libcamera: fix install staging typo
Message-ID: <20200706010952.848810-1-james.hilliard1@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This won't enable install to staging unless capitalized.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/libcamera/libcamera.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libcamera/libcamera.mk b/package/libcamera/libcamera.mk
index ebdf2dba34..a39e9f1c3e 100644
--- a/package/libcamera/libcamera.mk
+++ b/package/libcamera/libcamera.mk
@@ -16,7 +16,7 @@ LIBCAMERA_CONF_OPTS = \
 	-Dandroid=false \
 	-Ddocumentation=false \
 	-Dtest=false
-LIBCAMERA_INSTALL_STAGING = yes
+LIBCAMERA_INSTALL_STAGING = YES
 LIBCAMERA_LICENSE = \
 	LGPL-2.1+ (library), \
 	GPL-2.0+ (utils), \
-- 
2.25.1
