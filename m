From: Adrian Perez de Castro <aperez@igalia.com>
Date: Fri, 10 Jul 2020 14:47:30 +0300
Subject: [Buildroot] [PATCH 1/1] package/wpewebkit: security bump to version
 2.28.3
Message-ID: <20200710114730.805297-1-aperez@igalia.com>
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

  https://wpewebkit.org/release/wpewebkit-2.28.3.html

A detailed security advisory can be found at:

  https://wpewebkit.org/security/WSA-2020-0006.html

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
---
 package/wpewebkit/wpewebkit.hash | 8 ++++----
 package/wpewebkit/wpewebkit.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/wpewebkit/wpewebkit.hash b/package/wpewebkit/wpewebkit.hash
index 8c660d3003..fcc35c5024 100644
--- a/package/wpewebkit/wpewebkit.hash
+++ b/package/wpewebkit/wpewebkit.hash
@@ -1,7 +1,7 @@
-# From https://wpewebkit.org/releases/wpewebkit-2.28.2.tar.xz.sums
-md5  c1f17d4b031e9462692443e3c089789c  wpewebkit-2.28.2.tar.xz
-sha1  b109cfec921eb466227ab3b8d21c5f5717311c8e  wpewebkit-2.28.2.tar.xz
-sha256  6929d28744702ead3574484ca02645c457a6fdcd6b43ccc9766d98dc3664e8dc  wpewebkit-2.28.2.tar.xz
+# From https://wpewebkit.org/releases/wpewebkit-2.28.3.tar.xz.sums
+md5  0b3655598f340a5c83cc26423fefcf36  wpewebkit-2.28.3.tar.xz
+sha1  ea03d365584ef5e86ca28cec6ca072a4674e9312  wpewebkit-2.28.3.tar.xz
+sha256  2539263a4d73c00abfe0205f54770dc1f6d2b635edbe41e748b507254f21e98b  wpewebkit-2.28.3.tar.xz
 
 # Hashes for license files:
 sha256  0b5d3a7cc325942567373b0ecd757d07c132e0ebd7c97bfc63f7e1a76094edb4  Source/WebCore/LICENSE-APPLE
diff --git a/package/wpewebkit/wpewebkit.mk b/package/wpewebkit/wpewebkit.mk
index a6124d3529..22c3d96460 100644
--- a/package/wpewebkit/wpewebkit.mk
+++ b/package/wpewebkit/wpewebkit.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WPEWEBKIT_VERSION = 2.28.2
+WPEWEBKIT_VERSION = 2.28.3
 WPEWEBKIT_SITE = http://www.wpewebkit.org/releases
 WPEWEBKIT_SOURCE = wpewebkit-$(WPEWEBKIT_VERSION).tar.xz
 WPEWEBKIT_INSTALL_STAGING = YES
-- 
2.27.0
