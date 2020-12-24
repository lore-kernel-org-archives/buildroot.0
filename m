From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 24 Dec 2020 12:49:50 +0100
Subject: [Buildroot] [git commit branch/2020.11.x] package/webkitgtk:
 security bump to version 2.30.4
Message-ID: <20201224113602.B39CE88661@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e3a78b5ad2cd46b48a41e6e7da4973d6188fe555
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.11.x

This is a minor release which provides a fix for CVE-2020-13543.

Full release notes:

  https://webkitgtk.org/2020/12/15/webkitgtk2.30.4-released.html

A detailed security advisory can be found at:

  https://webkitgtk.org/security/WSA-2020-0009.html

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit d50c6c3ebe13e4d195a3ac44130ac13a14920456)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/webkitgtk/webkitgtk.hash | 8 ++++----
 package/webkitgtk/webkitgtk.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/webkitgtk/webkitgtk.hash b/package/webkitgtk/webkitgtk.hash
index 1849d9eff9..27f0e5a69d 100644
--- a/package/webkitgtk/webkitgtk.hash
+++ b/package/webkitgtk/webkitgtk.hash
@@ -1,7 +1,7 @@
-# From https://webkitgtk.org/releases/webkitgtk-2.30.3.tar.xz.sums
-md5  3db32cffeab82efcade1ce77f94865c2  webkitgtk-2.30.3.tar.xz
-sha1  6eed6e8a3c2f47533821169679fe381ceb0550be  webkitgtk-2.30.3.tar.xz
-sha256  6dea14f03916882816f2fed9497a5103fc54b2ab8602ab145ca991e4951e5e7f  webkitgtk-2.30.3.tar.xz
+# From https://webkitgtk.org/releases/webkitgtk-2.30.4.tar.xz.sums
+md5  81c813d77a7b52ef655922f9b387f3a1  webkitgtk-2.30.4.tar.xz
+sha1  330f45d7badf944fb01a3238ebb2ceaad8c2a91f  webkitgtk-2.30.4.tar.xz
+sha256  d595a37c5001ff787266b155e303a5f2e5b48a6d466f2714c2f30c11392f7b24  webkitgtk-2.30.4.tar.xz
 
 # Hashes for license files:
 sha256  0b5d3a7cc325942567373b0ecd757d07c132e0ebd7c97bfc63f7e1a76094edb4  Source/WebCore/LICENSE-APPLE
diff --git a/package/webkitgtk/webkitgtk.mk b/package/webkitgtk/webkitgtk.mk
index 0310f058f1..73111d383a 100644
--- a/package/webkitgtk/webkitgtk.mk
+++ b/package/webkitgtk/webkitgtk.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WEBKITGTK_VERSION = 2.30.3
+WEBKITGTK_VERSION = 2.30.4
 WEBKITGTK_SITE = https://www.webkitgtk.org/releases
 WEBKITGTK_SOURCE = webkitgtk-$(WEBKITGTK_VERSION).tar.xz
 WEBKITGTK_INSTALL_STAGING = YES
