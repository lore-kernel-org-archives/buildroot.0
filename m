From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 21 Oct 2017 12:39:42 +0200
Subject: [Buildroot] [git commit] webkitgtk: security bump to version 2.18.1
Message-ID: <20171021104922.636698102B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6d623e72770534c8e40e5afd7aa8fb77e49d1974
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This is a maintenance release of the current stable WebKitGTK+ version,
which contains bugfixes (many of them related to rendering, plus one
important fix for touch input) and many security fixes.

Release notes:

    https://webkitgtk.org/2017/10/18/webkitgtk2.18.1-released.html

Fixes CVE-2017-7081, CVE-2017-7087, CVE-2017-7089, CVE-2017-7090,
CVE-2017-7091, CVE-2017-7092, CVE-2017-7093, CVE-2017-7094,
CVE-2017-7095, CVE-2017-7096, CVE-2017-7098, CVE-2017-7099,
CVE-2017-7100, CVE-2017-7102, CVE-2017-7104, CVE-2017-7107,
CVE-2017-7109, CVE-2017-7111, CVE-2017-7117, CVE-2017-7120,
CVE-2017-7142:

    https://webkitgtk.org/security/WSA-2017-0008.html

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/webkitgtk/webkitgtk.hash | 8 ++++----
 package/webkitgtk/webkitgtk.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/webkitgtk/webkitgtk.hash b/package/webkitgtk/webkitgtk.hash
index c7a87f8..f83bd08 100644
--- a/package/webkitgtk/webkitgtk.hash
+++ b/package/webkitgtk/webkitgtk.hash
@@ -1,4 +1,4 @@
-# From https://webkitgtk.org/releases/webkitgtk-2.18.0.tar.xz.sums
-md5 10d86dd5a5b68875654cc38af139f382 webkitgtk-2.18.0.tar.xz
-sha1 e4d6cc7cff8729aa5ae6c17e10ed5ddf31048983 webkitgtk-2.18.0.tar.xz
-sha256 b583e46a3de36a3e80ba33b084ead60512a2046aca01ff61e50e519436e5038d webkitgtk-2.18.0.tar.xz
+# From https://webkitgtk.org/releases/webkitgtk-2.18.1.tar.xz.sums
+md5 951a6082ada2f7d0292d3251a3f9532b webkitgtk-2.18.1.tar.xz
+sha1 5054dd6b8afdc6e98b947e361011d6dca6da74e2 webkitgtk-2.18.1.tar.xz
+sha256 9cdb7b302fbc8a2a7e1e783b80391e64f8b12d70d6ebad4eb756dd59bf3ed795 webkitgtk-2.18.1.tar.xz
diff --git a/package/webkitgtk/webkitgtk.mk b/package/webkitgtk/webkitgtk.mk
index 7cdf28c..55c2dd8 100644
--- a/package/webkitgtk/webkitgtk.mk
+++ b/package/webkitgtk/webkitgtk.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WEBKITGTK_VERSION = 2.18.0
+WEBKITGTK_VERSION = 2.18.1
 WEBKITGTK_SITE = http://www.webkitgtk.org/releases
 WEBKITGTK_SOURCE = webkitgtk-$(WEBKITGTK_VERSION).tar.xz
 WEBKITGTK_INSTALL_STAGING = YES
