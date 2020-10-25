From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 25 Oct 2020 10:01:26 +0100
Subject: [Buildroot] [git commit] package/webkitgtk: bump to version 2.30.2
Message-ID: <20201025084921.F16D782980@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f09e3b065bae43b1cc9096a9752ed7788aed3a64
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This is a minor release which fixes a few build and networking issues.
Release notes:

  https://webkitgtk.org/2020/10/23/webkitgtk2.30.2-released.html

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/webkitgtk/webkitgtk.hash | 8 ++++----
 package/webkitgtk/webkitgtk.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/webkitgtk/webkitgtk.hash b/package/webkitgtk/webkitgtk.hash
index 0098fe1a66..30b8e4f11f 100644
--- a/package/webkitgtk/webkitgtk.hash
+++ b/package/webkitgtk/webkitgtk.hash
@@ -1,7 +1,7 @@
-# From https://webkitgtk.org/releases/webkitgtk-2.30.1.tar.xz.sums
-md5  de0f910d60de88273ffde7b4bb88bd42  webkitgtk-2.30.1.tar.xz
-sha1  23dd526e95399f97c758f8796e8cb184e9465eb7  webkitgtk-2.30.1.tar.xz
-sha256  17c59dfdadb7377192e9b59bc56c8a029c9fad4f38ed732b652bf33d0bd5d6b1  webkitgtk-2.30.1.tar.xz
+# From https://webkitgtk.org/releases/webkitgtk-2.30.2.tar.xz.sums
+md5  2163f1f982c63cb8fa75bf1b36396304  webkitgtk-2.30.2.tar.xz
+sha1  e27d336570226645f861b5a00116c17da39f9df4  webkitgtk-2.30.2.tar.xz
+sha256  c467e0bc2bc610c2570928e3fd63cedaadc4719cbf9b04aa99f79dd71ad5682a  webkitgtk-2.30.2.tar.xz
 
 # Hashes for license files:
 sha256  0b5d3a7cc325942567373b0ecd757d07c132e0ebd7c97bfc63f7e1a76094edb4  Source/WebCore/LICENSE-APPLE
diff --git a/package/webkitgtk/webkitgtk.mk b/package/webkitgtk/webkitgtk.mk
index 3d0780cb10..1f8582daf5 100644
--- a/package/webkitgtk/webkitgtk.mk
+++ b/package/webkitgtk/webkitgtk.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WEBKITGTK_VERSION = 2.30.1
+WEBKITGTK_VERSION = 2.30.2
 WEBKITGTK_SITE = https://www.webkitgtk.org/releases
 WEBKITGTK_SOURCE = webkitgtk-$(WEBKITGTK_VERSION).tar.xz
 WEBKITGTK_INSTALL_STAGING = YES
