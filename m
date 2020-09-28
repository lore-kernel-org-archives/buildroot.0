From: Adrian Perez de Castro <aperez@igalia.com>
Date: Tue, 29 Sep 2020 00:29:11 +0300
Subject: [Buildroot] [PATCH 1/1] package/webkitgtk: bump to version 2.30.1
Message-ID: <20200928212911.1342633-1-aperez@igalia.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This is a minor release which fixes a regression found in 2.30.0.
Release notes:

  https://webkitgtk.org/2020/09/21/webkitgtk2.30.1-released.html

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
---
 package/webkitgtk/webkitgtk.hash | 8 ++++----
 package/webkitgtk/webkitgtk.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/webkitgtk/webkitgtk.hash b/package/webkitgtk/webkitgtk.hash
index 31e30997e2..0098fe1a66 100644
--- a/package/webkitgtk/webkitgtk.hash
+++ b/package/webkitgtk/webkitgtk.hash
@@ -1,7 +1,7 @@
-# From https://webkitgtk.org/releases/webkitgtk-2.30.0.tar.xz.sums
-md5  71428fefd33f40583465649baf05ceb5  webkitgtk-2.30.0.tar.xz
-sha1  60407e68b5452b5fd90ab1c03d8cc844bb68b590  webkitgtk-2.30.0.tar.xz
-sha256  caf3dbf2d2383072614e34281f2fffb6331faf92f4ecf215f6f6a5a57f755d11  webkitgtk-2.30.0.tar.xz
+# From https://webkitgtk.org/releases/webkitgtk-2.30.1.tar.xz.sums
+md5  de0f910d60de88273ffde7b4bb88bd42  webkitgtk-2.30.1.tar.xz
+sha1  23dd526e95399f97c758f8796e8cb184e9465eb7  webkitgtk-2.30.1.tar.xz
+sha256  17c59dfdadb7377192e9b59bc56c8a029c9fad4f38ed732b652bf33d0bd5d6b1  webkitgtk-2.30.1.tar.xz
 
 # Hashes for license files:
 sha256  0b5d3a7cc325942567373b0ecd757d07c132e0ebd7c97bfc63f7e1a76094edb4  Source/WebCore/LICENSE-APPLE
diff --git a/package/webkitgtk/webkitgtk.mk b/package/webkitgtk/webkitgtk.mk
index b4623a407a..5293d2d0ff 100644
--- a/package/webkitgtk/webkitgtk.mk
+++ b/package/webkitgtk/webkitgtk.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WEBKITGTK_VERSION = 2.30.0
+WEBKITGTK_VERSION = 2.30.1
 WEBKITGTK_SITE = https://www.webkitgtk.org/releases
 WEBKITGTK_SOURCE = webkitgtk-$(WEBKITGTK_VERSION).tar.xz
 WEBKITGTK_INSTALL_STAGING = YES
-- 
2.28.0
