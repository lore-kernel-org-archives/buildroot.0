From: Adrian Perez de Castro <aperez@igalia.com>
Date: Sun, 26 Apr 2020 22:50:21 +0300
Subject: [Buildroot] [PATCH 1/1] package/wpewebkit: security bump to version
 2.28.2
Message-ID: <20200426195021.2625617-1-aperez@igalia.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This is a minor release which provides fixes for CVE-2020-11793,
CVE-2020-3887, CVE-2020-3894, and CVE-2020-3899.

Updating from 2.28.0 also brings a few rendering fixes, a build fix
on MIPS64, a build fix for GStreamer 1.12, and solves a couple of
crashes. The full release notes covering 2.28.1 and 2.28.2 can be
found at:

  https://wpewebkit.org/release/wpewebkit-2.28.1.html
  https://wpewebkit.org/release/wpewebkit-2.28.2.html

A detailed security advisory can be found at:

  https://wpewebkit.org/security/WSA-2020-0004.html

Note that the above does not cover all the CVEs, and a new advisory
including them is expected to be published in the next days.

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
---
 package/wpewebkit/wpewebkit.hash | 8 ++++----
 package/wpewebkit/wpewebkit.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/wpewebkit/wpewebkit.hash b/package/wpewebkit/wpewebkit.hash
index 2e7016fe38..8c660d3003 100644
--- a/package/wpewebkit/wpewebkit.hash
+++ b/package/wpewebkit/wpewebkit.hash
@@ -1,7 +1,7 @@
-# From https://wpewebkit.org/releases/wpewebkit-2.28.0.tar.xz.sums
-md5  4298b9d38b4f05f92995422ea9979893  wpewebkit-2.28.0.tar.xz
-sha1  9e791b6112cca8cda51ae7e991b545f4bf0bb46c  wpewebkit-2.28.0.tar.xz
-sha256  a85cd3cb46206a4929a9562d53379a7e7e2ec1a3224b34e2dcf5da30bb906722  wpewebkit-2.28.0.tar.xz
+# From https://wpewebkit.org/releases/wpewebkit-2.28.2.tar.xz.sums
+md5  c1f17d4b031e9462692443e3c089789c  wpewebkit-2.28.2.tar.xz
+sha1  b109cfec921eb466227ab3b8d21c5f5717311c8e  wpewebkit-2.28.2.tar.xz
+sha256  6929d28744702ead3574484ca02645c457a6fdcd6b43ccc9766d98dc3664e8dc  wpewebkit-2.28.2.tar.xz
 
 # Hashes for license files:
 sha256  0b5d3a7cc325942567373b0ecd757d07c132e0ebd7c97bfc63f7e1a76094edb4  Source/WebCore/LICENSE-APPLE
diff --git a/package/wpewebkit/wpewebkit.mk b/package/wpewebkit/wpewebkit.mk
index 9c969cae5a..a6124d3529 100644
--- a/package/wpewebkit/wpewebkit.mk
+++ b/package/wpewebkit/wpewebkit.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WPEWEBKIT_VERSION = 2.28.0
+WPEWEBKIT_VERSION = 2.28.2
 WPEWEBKIT_SITE = http://www.wpewebkit.org/releases
 WPEWEBKIT_SOURCE = wpewebkit-$(WPEWEBKIT_VERSION).tar.xz
 WPEWEBKIT_INSTALL_STAGING = YES
-- 
2.26.2
