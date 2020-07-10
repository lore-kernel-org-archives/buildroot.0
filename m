From: Adrian Perez de Castro <aperez@igalia.com>
Date: Fri, 10 Jul 2020 14:52:48 +0300
Subject: [Buildroot] [PATCH 1/1] package/webkitgtk: security bump to version
 2.28.3
Message-ID: <20200710115248.806492-1-aperez@igalia.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This is a minor release which provides fixes for CVE-2020-9800,
CVE-2020-9802, CVE-2020-9803, CVE-2020-9805, CVE-2020-9806,
CVE-2020-9807, CVE-2020-9843, CVE-2020-9850, and CVE-2020-13753.

Updating from 2.28.2 also brings in the usual batch of fixes, including
important improvements to threading in the media player. Full release
notes can be found at:

  https://webkitgtk.org/2020/07/09/webkitgtk2.28.3-released.html

A detailed security advisory can be found at:

  https://webkitgtk.org/security/WSA-2020-0006.html

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
---
 package/webkitgtk/webkitgtk.hash | 8 ++++----
 package/webkitgtk/webkitgtk.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/webkitgtk/webkitgtk.hash b/package/webkitgtk/webkitgtk.hash
index a76cc925a1..44263745e4 100644
--- a/package/webkitgtk/webkitgtk.hash
+++ b/package/webkitgtk/webkitgtk.hash
@@ -1,7 +1,7 @@
-# From https://webkitgtk.org/releases/webkitgtk-2.28.2.tar.xz.sums
-md5  ec0ef870ca37e3a5ebbead2f268a28ec  webkitgtk-2.28.2.tar.xz
-sha1  0aba97beba7b2677ed2d28aac51e429cb26c3fe6  webkitgtk-2.28.2.tar.xz
-sha256  b9d23525cfd8d22c37b5d964a9fe9a8ce7583042a2f8d3922e71e6bbc68c30bd  webkitgtk-2.28.2.tar.xz
+# From https://webkitgtk.org/releases/webkitgtk-2.28.3.tar.xz.sums
+md5  a03a4dcd2819baca14fdec5af68b4356  webkitgtk-2.28.3.tar.xz
+sha1  af1d845d373e67fd666105e798a44e2cadaef83c  webkitgtk-2.28.3.tar.xz
+sha256  f0898ac072c220e13a4aee819408421a6cb56a6eb89170ceafe52468b0903522  webkitgtk-2.28.3.tar.xz
 
 # Hashes for license files:
 sha256  0b5d3a7cc325942567373b0ecd757d07c132e0ebd7c97bfc63f7e1a76094edb4  Source/WebCore/LICENSE-APPLE
diff --git a/package/webkitgtk/webkitgtk.mk b/package/webkitgtk/webkitgtk.mk
index 2abb083fc6..f38ea5d20a 100644
--- a/package/webkitgtk/webkitgtk.mk
+++ b/package/webkitgtk/webkitgtk.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WEBKITGTK_VERSION = 2.28.2
+WEBKITGTK_VERSION = 2.28.3
 WEBKITGTK_SITE = https://www.webkitgtk.org/releases
 WEBKITGTK_SOURCE = webkitgtk-$(WEBKITGTK_VERSION).tar.xz
 WEBKITGTK_INSTALL_STAGING = YES
-- 
2.27.0
