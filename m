From: Adrian Perez de Castro <aperez@igalia.com>
Date: Wed, 16 Sep 2020 01:30:52 +0300
Subject: [Buildroot] [PATCH 5/6] package/wpewebkit: bump to version 2.30.0
In-Reply-To: <20200915223053.3090447-1-aperez@igalia.com>
References: <20200915223053.3090447-1-aperez@igalia.com>
Message-ID: <20200915223053.3090447-6-aperez@igalia.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This is a new major release which bring in many improvements and new
features. For a complete list, please refer to the release notes:

  https://wpewebkit.org/release/wpewebkit-2.30.0.html

None of the new features need additional dependencies.

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
---
 package/wpewebkit/wpewebkit.hash | 6 +++---
 package/wpewebkit/wpewebkit.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/wpewebkit/wpewebkit.hash b/package/wpewebkit/wpewebkit.hash
index 1a6fbc8b96..4ba5c446d9 100644
--- a/package/wpewebkit/wpewebkit.hash
+++ b/package/wpewebkit/wpewebkit.hash
@@ -1,7 +1,7 @@
 # From https://wpewebkit.org/releases/wpewebkit-2.28.4.tar.xz.sums
-md5  6ab041f6ebdb2e053981de5980c864e7  wpewebkit-2.28.4.tar.xz
-sha1  b31739a86a269eac4ddd5e537cdf954224672450  wpewebkit-2.28.4.tar.xz
-sha256  785d83b99cd45cedb7c4f1f697db773a5a81eb0a42aeeafa3c623053f6fde87a  wpewebkit-2.28.4.tar.xz
+md5  b91b85b645061189765a9455a0539df1  wpewebkit-2.30.0.tar.xz
+sha1  243f2759f6fd06fdaefa84cbfa80e49559fbd14b  wpewebkit-2.30.0.tar.xz
+sha256  d1a99383ac3344195d09b4a4256c15dc5269c8585b3d836f43a057e60bb6f460  wpewebkit-2.30.0.tar.xz
 
 # Hashes for license files:
 sha256  0b5d3a7cc325942567373b0ecd757d07c132e0ebd7c97bfc63f7e1a76094edb4  Source/WebCore/LICENSE-APPLE
diff --git a/package/wpewebkit/wpewebkit.mk b/package/wpewebkit/wpewebkit.mk
index 646bdd9384..ea198cc75e 100644
--- a/package/wpewebkit/wpewebkit.mk
+++ b/package/wpewebkit/wpewebkit.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WPEWEBKIT_VERSION = 2.28.4
+WPEWEBKIT_VERSION = 2.30.0
 WPEWEBKIT_SITE = http://www.wpewebkit.org/releases
 WPEWEBKIT_SOURCE = wpewebkit-$(WPEWEBKIT_VERSION).tar.xz
 WPEWEBKIT_INSTALL_STAGING = YES
-- 
2.28.0
