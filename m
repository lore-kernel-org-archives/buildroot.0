From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 31 Jan 2018 11:51:56 +0100
Subject: [Buildroot] [git commit branch/2017.11.x] webkitgtk: security bump
 to version 2.18.6
Message-ID: <20180131123622.0297E8568A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c58c9138dfc8d33e086931343106251b90e99e63
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.11.x

This is a maintenance release of the current stable WebKitGTK+ version,
which contains security fixes for CVE-2018-4088, CVE-2017-13885,
CVE-2017-7165, CVE-2017-13884, CVE-2017-7160, CVE-2017-7153,
CVE-2017-7153, CVE-2017-7161, and CVE-2018-4096. Additionally, it solves
a GStreamer deadlock when stopping video playback, and contains fixes
and improvements for the WebDriver implementation.

Release notes can be found in the announcement:

  https://webkitgtk.org/2018/01/24/webkitgtk2.18.6-released.html

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 54798893b858c597eb70c387400866bfbfb9f0be)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/webkitgtk/webkitgtk.hash | 8 ++++----
 package/webkitgtk/webkitgtk.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/webkitgtk/webkitgtk.hash b/package/webkitgtk/webkitgtk.hash
index 0eeaca506f..dd2b28d372 100644
--- a/package/webkitgtk/webkitgtk.hash
+++ b/package/webkitgtk/webkitgtk.hash
@@ -1,7 +1,7 @@
-# From https://webkitgtk.org/releases/webkitgtk-2.18.5.tar.xz.sums
-md5 af18c2cfa00cadfd0b4d8db21cab011d webkitgtk-2.18.5.tar.xz
-sha1 5f36db464f6b7bbe6a57e55bc9bb172f87a4c398 webkitgtk-2.18.5.tar.xz
-sha256 0c6d80cc7eb5d32f8063041fa11a1a6f17a29765c2f69c6bc862cd47c2d539b8 webkitgtk-2.18.5.tar.xz
+# From https://webkitgtk.org/releases/webkitgtk-2.18.6.tar.xz.sums
+md5 c1a548595135ee75ad3bf2e18ac83112 webkitgtk-2.18.6.tar.xz
+sha1 fb0daa85142cfe8822de518dfaa7bd5c3cdd6c23 webkitgtk-2.18.6.tar.xz
+sha256 93912cc2f40f12e452be1ca4babdbdaac0ec4f828d441257a6b06c2963bbac3c webkitgtk-2.18.6.tar.xz
 
 # Hashes for license files:
 sha256 0b5d3a7cc325942567373b0ecd757d07c132e0ebd7c97bfc63f7e1a76094edb4 Source/WebCore/LICENSE-APPLE
diff --git a/package/webkitgtk/webkitgtk.mk b/package/webkitgtk/webkitgtk.mk
index 7b364cf467..eb39664b1e 100644
--- a/package/webkitgtk/webkitgtk.mk
+++ b/package/webkitgtk/webkitgtk.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WEBKITGTK_VERSION = 2.18.5
+WEBKITGTK_VERSION = 2.18.6
 WEBKITGTK_SITE = http://www.webkitgtk.org/releases
 WEBKITGTK_SOURCE = webkitgtk-$(WEBKITGTK_VERSION).tar.xz
 WEBKITGTK_INSTALL_STAGING = YES
