From: Adrian Perez de Castro <aperez@igalia.com>
Date: Mon, 30 Sep 2019 11:25:09 +0300
Subject: [Buildroot] [PATCH 1/1] package/wpewebkit: bump to version 2.26.1
Message-ID: <20190930082509.23743-1-aperez@igalia.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Release notes:

  https://wpewebkit.org/release/wpewebkit-2.26.1.html

This is a bugfix release which fixes a few issues deteted in 2.26.0
and includes media playback improvements as well.

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
---
 package/wpewebkit/wpewebkit.hash | 8 ++++----
 package/wpewebkit/wpewebkit.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/wpewebkit/wpewebkit.hash b/package/wpewebkit/wpewebkit.hash
index 7390369b38..052252c32e 100644
--- a/package/wpewebkit/wpewebkit.hash
+++ b/package/wpewebkit/wpewebkit.hash
@@ -1,7 +1,7 @@
-# From https://wpewebkit.org/releases/wpewebkit-2.26.0.tar.xz.sums
-md5 59a2e64f145b3445187a22eff1f73293 wpewebkit-2.26.0.tar.xz
-sha1 757ab5da23ef7944332d4c57fcf56a932e933ce4 wpewebkit-2.26.0.tar.xz
-sha256 a97a24fe0c22243c873c359d7636512c01016ea2068a457ba651040f1a07ee3e wpewebkit-2.26.0.tar.xz
+# From https://wpewebkit.org/releases/wpewebkit-2.26.1.tar.xz.sums
+md5 bec094fe878e03f42de751cbaf0b3e99 wpewebkit-2.26.1.tar.xz
+sha1 53dfafab8d5ccb537e7330febb9504c390e3bf52 wpewebkit-2.26.1.tar.xz
+sha256 d1ae85dffb5bfc106c5ac6d5e73a3dfe3cb2c1df1f18c16103e1dc744cd4ac14 wpewebkit-2.26.1.tar.xz
 
 # Hashes for license files:
 sha256 0b5d3a7cc325942567373b0ecd757d07c132e0ebd7c97bfc63f7e1a76094edb4 Source/WebCore/LICENSE-APPLE
diff --git a/package/wpewebkit/wpewebkit.mk b/package/wpewebkit/wpewebkit.mk
index 9db974299b..012e67af1f 100644
--- a/package/wpewebkit/wpewebkit.mk
+++ b/package/wpewebkit/wpewebkit.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WPEWEBKIT_VERSION = 2.26.0
+WPEWEBKIT_VERSION = 2.26.1
 WPEWEBKIT_SITE = http://www.wpewebkit.org/releases
 WPEWEBKIT_SOURCE = wpewebkit-$(WPEWEBKIT_VERSION).tar.xz
 WPEWEBKIT_INSTALL_STAGING = YES
-- 
2.23.0
