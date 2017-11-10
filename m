From: Adrian Perez de Castro <aperez@igalia.com>
Date: Fri, 10 Nov 2017 16:03:04 +0200
Subject: [Buildroot] [PATCH 1/1] webkitgtk: security bump to version 2.18.3
Message-ID: <20171110140304.12234-1-aperez@igalia.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This is a maintenance release of the current stable WebKitGTK+ version,
which contains a minor rendering fix, another for the WebDriver
implementation, and security fixes for CVE-2017-13798, CVE-2017-13788,
and CVE-2017-13803.

Release notes:

    https://webkitgtk.org/2017/11/10/webkitgtk2.18.3-released.html

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
---
 package/webkitgtk/webkitgtk.hash | 8 ++++----
 package/webkitgtk/webkitgtk.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/webkitgtk/webkitgtk.hash b/package/webkitgtk/webkitgtk.hash
index b1161157e7..669bb1cc62 100644
--- a/package/webkitgtk/webkitgtk.hash
+++ b/package/webkitgtk/webkitgtk.hash
@@ -1,4 +1,4 @@
-# From https://webkitgtk.org/releases/webkitgtk-2.18.2.tar.xz.sums
-md5 f63b3897d6fbf660bf72dfaca1fdea16 webkitgtk-2.18.2.tar.xz
-sha1 75571807a1f8c9efdf62f1c37e9fadf52b73d367 webkitgtk-2.18.2.tar.xz
-sha256 b14cb3f1b5321b1dc50abcc0445a97f8e2f8813562bca7ce4d2f8069f6fec8e7 webkitgtk-2.18.2.tar.xz
+# From https://webkitgtk.org/releases/webkitgtk-2.18.3.tar.xz.sums
+md5 264a22d7467deae606e42b6eb5dd65af webkitgtk-2.18.3.tar.xz
+sha1 164cad34281ef597a3d4ad214e8037c3ddef4d17 webkitgtk-2.18.3.tar.xz
+sha256 e15420e1616a6f70f321541d467af5ca285bff66b1e0fa68a01df3ccf1b18f9e webkitgtk-2.18.3.tar.xz
diff --git a/package/webkitgtk/webkitgtk.mk b/package/webkitgtk/webkitgtk.mk
index c78f6b38e1..c4675463fa 100644
--- a/package/webkitgtk/webkitgtk.mk
+++ b/package/webkitgtk/webkitgtk.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WEBKITGTK_VERSION = 2.18.2
+WEBKITGTK_VERSION = 2.18.3
 WEBKITGTK_SITE = http://www.webkitgtk.org/releases
 WEBKITGTK_SOURCE = webkitgtk-$(WEBKITGTK_VERSION).tar.xz
 WEBKITGTK_INSTALL_STAGING = YES
-- 
2.15.0
