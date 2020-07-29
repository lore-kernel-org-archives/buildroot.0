From: Adrian Perez de Castro <aperez@igalia.com>
Date: Wed, 29 Jul 2020 17:22:52 +0300
Subject: [Buildroot] [PATCH 1/1] package/wpewebkit: security bump to version
 2.28.4
Message-ID: <20200729142252.3411989-1-aperez@igalia.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This is a minor release which provides fixes for CVE-2020-9862,
CVE-2020-9893, CVE-2020-9894, CVE-2020-9895, CVE-2020-9915, and
CVE-2020-9925.

Full release notes can be found at:

  https://wpewebkit.org/release/wpewebkit-2.28.4.html

A detailed security advisory can be found at:

  https://wpewebkit.org/security/WSA-2020-0007.html

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
---
 package/wpewebkit/wpewebkit.hash | 8 ++++----
 package/wpewebkit/wpewebkit.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/wpewebkit/wpewebkit.hash b/package/wpewebkit/wpewebkit.hash
index fcc35c5024..1a6fbc8b96 100644
--- a/package/wpewebkit/wpewebkit.hash
+++ b/package/wpewebkit/wpewebkit.hash
@@ -1,7 +1,7 @@
-# From https://wpewebkit.org/releases/wpewebkit-2.28.3.tar.xz.sums
-md5  0b3655598f340a5c83cc26423fefcf36  wpewebkit-2.28.3.tar.xz
-sha1  ea03d365584ef5e86ca28cec6ca072a4674e9312  wpewebkit-2.28.3.tar.xz
-sha256  2539263a4d73c00abfe0205f54770dc1f6d2b635edbe41e748b507254f21e98b  wpewebkit-2.28.3.tar.xz
+# From https://wpewebkit.org/releases/wpewebkit-2.28.4.tar.xz.sums
+md5  6ab041f6ebdb2e053981de5980c864e7  wpewebkit-2.28.4.tar.xz
+sha1  b31739a86a269eac4ddd5e537cdf954224672450  wpewebkit-2.28.4.tar.xz
+sha256  785d83b99cd45cedb7c4f1f697db773a5a81eb0a42aeeafa3c623053f6fde87a  wpewebkit-2.28.4.tar.xz
 
 # Hashes for license files:
 sha256  0b5d3a7cc325942567373b0ecd757d07c132e0ebd7c97bfc63f7e1a76094edb4  Source/WebCore/LICENSE-APPLE
diff --git a/package/wpewebkit/wpewebkit.mk b/package/wpewebkit/wpewebkit.mk
index 22c3d96460..646bdd9384 100644
--- a/package/wpewebkit/wpewebkit.mk
+++ b/package/wpewebkit/wpewebkit.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WPEWEBKIT_VERSION = 2.28.3
+WPEWEBKIT_VERSION = 2.28.4
 WPEWEBKIT_SITE = http://www.wpewebkit.org/releases
 WPEWEBKIT_SOURCE = wpewebkit-$(WPEWEBKIT_VERSION).tar.xz
 WPEWEBKIT_INSTALL_STAGING = YES
-- 
2.28.0
