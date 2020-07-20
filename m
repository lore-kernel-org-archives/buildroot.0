From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 20 Jul 2020 18:45:16 +0200
Subject: [Buildroot] [git commit branch/2020.05.x] package/libcamera: fix
 install staging typo
Message-ID: <20200720195318.019E68636F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=28a48f969398767cbafc0e008786cd6e4220e48f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.05.x

This won't enable install to staging unless capitalized.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit b6141b2aa127cebb29bfff7a0beb392251972092)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libcamera/libcamera.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libcamera/libcamera.mk b/package/libcamera/libcamera.mk
index d209a38df3..2be344899e 100644
--- a/package/libcamera/libcamera.mk
+++ b/package/libcamera/libcamera.mk
@@ -9,7 +9,7 @@ LIBCAMERA_VERSION = 448393f77ec9e37cb807e8e8d35c1a4877d253d4
 LIBCAMERA_SITE_METHOD = git
 LIBCAMERA_DEPENDENCIES = udev
 LIBCAMERA_CONF_OPTS = -Dtest=false -Ddocumentation=false
-LIBCAMERA_INSTALL_STAGING = yes
+LIBCAMERA_INSTALL_STAGING = YES
 LIBCAMERA_LICENSE = LGPL-2.1+ (library), GPL-2.0+ (utils)
 LIBCAMERA_LICENSE_FILES = \
 	licenses/gnu-gpl-2.0.txt \
