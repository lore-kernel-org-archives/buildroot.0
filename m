From: Sagaert Johan <sagaert.johan@skynet.be>
Date: Sun, 13 Jan 2013 13:55:23 +0100
Subject: [Buildroot] [PATCH 1/1] pixman : bump version
Message-ID: <1358081723-14990-1-git-send-email-sagaert.johan@skynet.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


pixman : bump version
Signed-off-by: Sagaert Johan <sagaert.johan@skynet.be>
---
 package/pixman/pixman.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/pixman/pixman.mk b/package/pixman/pixman.mk
index 4879594..607f82e 100644
--- a/package/pixman/pixman.mk
+++ b/package/pixman/pixman.mk
@@ -3,7 +3,7 @@
 # pixman
 #
 ################################################################################
-PIXMAN_VERSION = 0.25.2
+PIXMAN_VERSION = 0.28.2
 PIXMAN_SITE = http://xorg.freedesktop.org/releases/individual/lib
 PIXMAN_INSTALL_STAGING = YES
 PIXMAN_DEPENDENCIES = host-pkgconf
-- 
1.8.0.1
