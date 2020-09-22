From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 22 Sep 2020 21:41:00 +0200
Subject: [Buildroot] [git commit] package/wpewebkit: bump to version 2.30.1
Message-ID: <20200922193137.B5EB78B49C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=371f6744e5d88669af8d26b73683b4302f7a7d5a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update to a new major release which bring in many improvements and new
features. The .0 version is skipped because it includes a regression
which was fixed by the .1 release. For a complete list of changed,
please refer to the release notes:

  https://wpewebkit.org/release/wpewebkit-2.30.0.html
  https://wpewebkit.org/release/wpewebkit-2.30.1.html

None of the new features in WPE WebKit 2.30.x need additional dependencies.

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/wpewebkit/wpewebkit.hash | 8 ++++----
 package/wpewebkit/wpewebkit.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/wpewebkit/wpewebkit.hash b/package/wpewebkit/wpewebkit.hash
index 1a6fbc8b96..5e22845a59 100644
--- a/package/wpewebkit/wpewebkit.hash
+++ b/package/wpewebkit/wpewebkit.hash
@@ -1,7 +1,7 @@
-# From https://wpewebkit.org/releases/wpewebkit-2.28.4.tar.xz.sums
-md5  6ab041f6ebdb2e053981de5980c864e7  wpewebkit-2.28.4.tar.xz
-sha1  b31739a86a269eac4ddd5e537cdf954224672450  wpewebkit-2.28.4.tar.xz
-sha256  785d83b99cd45cedb7c4f1f697db773a5a81eb0a42aeeafa3c623053f6fde87a  wpewebkit-2.28.4.tar.xz
+# From https://wpewebkit.org/releases/wpewebkit-2.30.1.tar.xz.sums
+md5  251228a6e2917eff90a3eb6e9a7e920d  wpewebkit-2.30.1.tar.xz
+sha1  7f5bdc79d4694ab5644b7fed9bd7311c2cbc988f  wpewebkit-2.30.1.tar.xz
+sha256  78c0135d935b980fc64fbddf1fbaf441920edda4eeb4c16857ee8dc985650c25  wpewebkit-2.30.1.tar.xz
 
 # Hashes for license files:
 sha256  0b5d3a7cc325942567373b0ecd757d07c132e0ebd7c97bfc63f7e1a76094edb4  Source/WebCore/LICENSE-APPLE
diff --git a/package/wpewebkit/wpewebkit.mk b/package/wpewebkit/wpewebkit.mk
index 646bdd9384..d6a3dca551 100644
--- a/package/wpewebkit/wpewebkit.mk
+++ b/package/wpewebkit/wpewebkit.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WPEWEBKIT_VERSION = 2.28.4
+WPEWEBKIT_VERSION = 2.30.1
 WPEWEBKIT_SITE = http://www.wpewebkit.org/releases
 WPEWEBKIT_SOURCE = wpewebkit-$(WPEWEBKIT_VERSION).tar.xz
 WPEWEBKIT_INSTALL_STAGING = YES
