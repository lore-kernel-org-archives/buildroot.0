From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 8 Apr 2020 21:12:41 +0200
Subject: [Buildroot] [git commit] package/webkitgtk: bump to version 2.28.0
Message-ID: <20200408190448.3041C8E01F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6ebd15285300a41d6a0154f302f04199af1b7652
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/webkitgtk/webkitgtk.hash | 8 ++++----
 package/webkitgtk/webkitgtk.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/webkitgtk/webkitgtk.hash b/package/webkitgtk/webkitgtk.hash
index 0dfbe93137..b63a734e3d 100644
--- a/package/webkitgtk/webkitgtk.hash
+++ b/package/webkitgtk/webkitgtk.hash
@@ -1,7 +1,7 @@
-# From https://webkitgtk.org/releases/webkitgtk-2.26.4.tar.xz.sums
-md5  60f881729f3b71244b7f6e58790073e0  webkitgtk-2.26.4.tar.xz
-sha1  72f209c08ecc8ad4f0f6b767d4fa1be7a652df33  webkitgtk-2.26.4.tar.xz
-sha256  4386900713dfadf9741177210b32623cab22562a79ffd0d446b66569934b113f  webkitgtk-2.26.4.tar.xz
+# From https://webkitgtk.org/releases/webkitgtk-2.28.0.tar.xz.sums
+md5 0bf11df8117ea64f6b8de59d278a2c78 webkitgtk-2.28.0.tar.xz
+sha1 927d0922b986fd06567015ce4425ed05d9fca209 webkitgtk-2.28.0.tar.xz
+sha256 361f3d178f62a9c112cbadfedd46106c34455c26d57a12a28fb3b09178d20e8b webkitgtk-2.28.0.tar.xz
 
 # Hashes for license files:
 sha256  0b5d3a7cc325942567373b0ecd757d07c132e0ebd7c97bfc63f7e1a76094edb4  Source/WebCore/LICENSE-APPLE
diff --git a/package/webkitgtk/webkitgtk.mk b/package/webkitgtk/webkitgtk.mk
index cdb6556554..2578847b05 100644
--- a/package/webkitgtk/webkitgtk.mk
+++ b/package/webkitgtk/webkitgtk.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WEBKITGTK_VERSION = 2.26.4
+WEBKITGTK_VERSION = 2.28.0
 WEBKITGTK_SITE = https://www.webkitgtk.org/releases
 WEBKITGTK_SOURCE = webkitgtk-$(WEBKITGTK_VERSION).tar.xz
 WEBKITGTK_INSTALL_STAGING = YES
