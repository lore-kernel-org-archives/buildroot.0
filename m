From: Adrian Perez de Castro <aperez@igalia.com>
Date: Fri, 27 Oct 2017 19:10:33 +0300
Subject: [Buildroot] [PATCH 1/1] webkitgtk: security bump to version 2.18.2
Message-ID: <20171027161033.8582-1-aperez@igalia.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This is a maintenance release of the current stable WebKitGTK+ version,
which contains bugfixes; mostly for crashes and rendering issues, plus
one important fix for the layout or Arabic text.

Release notes:

    https://webkitgtk.org/2017/10/27/webkitgtk2.18.2-released.html

Even though an acconpanying security advisory has not been published
for this release, the release contains fixes for several crashes (one
of them for the decoder of the very common GIF image format), which
arguably can be considered potential security issues.

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
---
 package/webkitgtk/webkitgtk.hash | 8 ++++----
 package/webkitgtk/webkitgtk.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/webkitgtk/webkitgtk.hash b/package/webkitgtk/webkitgtk.hash
index f83bd0878a..b1161157e7 100644
--- a/package/webkitgtk/webkitgtk.hash
+++ b/package/webkitgtk/webkitgtk.hash
@@ -1,4 +1,4 @@
-# From https://webkitgtk.org/releases/webkitgtk-2.18.1.tar.xz.sums
-md5 951a6082ada2f7d0292d3251a3f9532b webkitgtk-2.18.1.tar.xz
-sha1 5054dd6b8afdc6e98b947e361011d6dca6da74e2 webkitgtk-2.18.1.tar.xz
-sha256 9cdb7b302fbc8a2a7e1e783b80391e64f8b12d70d6ebad4eb756dd59bf3ed795 webkitgtk-2.18.1.tar.xz
+# From https://webkitgtk.org/releases/webkitgtk-2.18.2.tar.xz.sums
+md5 f63b3897d6fbf660bf72dfaca1fdea16 webkitgtk-2.18.2.tar.xz
+sha1 75571807a1f8c9efdf62f1c37e9fadf52b73d367 webkitgtk-2.18.2.tar.xz
+sha256 b14cb3f1b5321b1dc50abcc0445a97f8e2f8813562bca7ce4d2f8069f6fec8e7 webkitgtk-2.18.2.tar.xz
diff --git a/package/webkitgtk/webkitgtk.mk b/package/webkitgtk/webkitgtk.mk
index 55c2dd8cc4..c78f6b38e1 100644
--- a/package/webkitgtk/webkitgtk.mk
+++ b/package/webkitgtk/webkitgtk.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WEBKITGTK_VERSION = 2.18.1
+WEBKITGTK_VERSION = 2.18.2
 WEBKITGTK_SITE = http://www.webkitgtk.org/releases
 WEBKITGTK_SOURCE = webkitgtk-$(WEBKITGTK_VERSION).tar.xz
 WEBKITGTK_INSTALL_STAGING = YES
-- 
2.14.3
