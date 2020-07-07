From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 7 Jul 2020 23:04:18 +0200
Subject: [Buildroot] [git commit] package/libcamera: fix install staging typo
Message-ID: <20200707210135.65FA581475@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b6141b2aa127cebb29bfff7a0beb392251972092
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This won't enable install to staging unless capitalized.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
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
