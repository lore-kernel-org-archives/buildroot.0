From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 13 Aug 2020 21:14:26 +0200
Subject: [Buildroot] [git commit branch/2020.05.x] package/webkitgtk:
 security bump to version 2.28.4
Message-ID: <20200813190812.29C2186061@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=96907d96cae1d0fa55d1f64e9317a06a426a96fe
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.05.x

This is a minor release which provides fixes for CVE-2020-9862,
CVE-2020-9893, CVE-2020-9894, CVE-2020-9895, CVE-2020-9915, and
CVE-2020-9925.

Full release notes can be found at:

  https://webkitgtk.org/2020/07/28/webkitgtk2.28.4-released.html

A detailed security advisory can be found at:

  https://webkitgtk.org/security/WSA-2020-0007.html

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 0b4d5678f1adbde4f41e2039e0a93f714a0db7d4)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/webkitgtk/webkitgtk.hash | 8 ++++----
 package/webkitgtk/webkitgtk.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/webkitgtk/webkitgtk.hash b/package/webkitgtk/webkitgtk.hash
index 44263745e4..cdca65a5a8 100644
--- a/package/webkitgtk/webkitgtk.hash
+++ b/package/webkitgtk/webkitgtk.hash
@@ -1,7 +1,7 @@
-# From https://webkitgtk.org/releases/webkitgtk-2.28.3.tar.xz.sums
-md5  a03a4dcd2819baca14fdec5af68b4356  webkitgtk-2.28.3.tar.xz
-sha1  af1d845d373e67fd666105e798a44e2cadaef83c  webkitgtk-2.28.3.tar.xz
-sha256  f0898ac072c220e13a4aee819408421a6cb56a6eb89170ceafe52468b0903522  webkitgtk-2.28.3.tar.xz
+# From https://webkitgtk.org/releases/webkitgtk-2.28.4.tar.xz.sums
+md5  10e0cce27208dfbd4cf63dd68a9a47d7  webkitgtk-2.28.4.tar.xz
+sha1  70e9dd80647b30eaaf8a7f5b30d8869cd1254056  webkitgtk-2.28.4.tar.xz
+sha256  821952e8c9303ed752f1fb1d4283f612c25249d00d705d2b79c2db1bc49c9464  webkitgtk-2.28.4.tar.xz
 
 # Hashes for license files:
 sha256  0b5d3a7cc325942567373b0ecd757d07c132e0ebd7c97bfc63f7e1a76094edb4  Source/WebCore/LICENSE-APPLE
diff --git a/package/webkitgtk/webkitgtk.mk b/package/webkitgtk/webkitgtk.mk
index f38ea5d20a..65a4439839 100644
--- a/package/webkitgtk/webkitgtk.mk
+++ b/package/webkitgtk/webkitgtk.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WEBKITGTK_VERSION = 2.28.3
+WEBKITGTK_VERSION = 2.28.4
 WEBKITGTK_SITE = https://www.webkitgtk.org/releases
 WEBKITGTK_SOURCE = webkitgtk-$(WEBKITGTK_VERSION).tar.xz
 WEBKITGTK_INSTALL_STAGING = YES
