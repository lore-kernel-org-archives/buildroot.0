From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 19 Sep 2020 15:23:32 +0200
Subject: [Buildroot] [git commit] package/webkitgtk: bump to version 2.30.0
Message-ID: <20200919131428.61F3B877EB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b2df73ef84f07d451288f44119b272d863584f96
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This is a new major release which bring in many improvements and new
features. For a complete list, please refer to the release notes:

  https://webkitgtk.org/2020/09/11/webkitgtk2.30.0-released.html

None of the new features need additional dependencies.

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/webkitgtk/webkitgtk.hash | 8 ++++----
 package/webkitgtk/webkitgtk.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/webkitgtk/webkitgtk.hash b/package/webkitgtk/webkitgtk.hash
index cdca65a5a8..31e30997e2 100644
--- a/package/webkitgtk/webkitgtk.hash
+++ b/package/webkitgtk/webkitgtk.hash
@@ -1,7 +1,7 @@
-# From https://webkitgtk.org/releases/webkitgtk-2.28.4.tar.xz.sums
-md5  10e0cce27208dfbd4cf63dd68a9a47d7  webkitgtk-2.28.4.tar.xz
-sha1  70e9dd80647b30eaaf8a7f5b30d8869cd1254056  webkitgtk-2.28.4.tar.xz
-sha256  821952e8c9303ed752f1fb1d4283f612c25249d00d705d2b79c2db1bc49c9464  webkitgtk-2.28.4.tar.xz
+# From https://webkitgtk.org/releases/webkitgtk-2.30.0.tar.xz.sums
+md5  71428fefd33f40583465649baf05ceb5  webkitgtk-2.30.0.tar.xz
+sha1  60407e68b5452b5fd90ab1c03d8cc844bb68b590  webkitgtk-2.30.0.tar.xz
+sha256  caf3dbf2d2383072614e34281f2fffb6331faf92f4ecf215f6f6a5a57f755d11  webkitgtk-2.30.0.tar.xz
 
 # Hashes for license files:
 sha256  0b5d3a7cc325942567373b0ecd757d07c132e0ebd7c97bfc63f7e1a76094edb4  Source/WebCore/LICENSE-APPLE
diff --git a/package/webkitgtk/webkitgtk.mk b/package/webkitgtk/webkitgtk.mk
index 65a4439839..b4623a407a 100644
--- a/package/webkitgtk/webkitgtk.mk
+++ b/package/webkitgtk/webkitgtk.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WEBKITGTK_VERSION = 2.28.4
+WEBKITGTK_VERSION = 2.30.0
 WEBKITGTK_SITE = https://www.webkitgtk.org/releases
 WEBKITGTK_SOURCE = webkitgtk-$(WEBKITGTK_VERSION).tar.xz
 WEBKITGTK_INSTALL_STAGING = YES
