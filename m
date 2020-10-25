From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 25 Oct 2020 10:03:28 +0100
Subject: [Buildroot] [git commit] package/wpewebkit: bump to version 2.30.2
Message-ID: <20201025091009.A3E538146B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6fdfd5326ab4825366214338c3a46c486d086fe6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This is a minor release which fixes a few build and networking issues.
Release notes:

  https://wpewebkit.org/release/wpewebkit-2.30.2.html

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/wpewebkit/wpewebkit.hash | 8 ++++----
 package/wpewebkit/wpewebkit.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/wpewebkit/wpewebkit.hash b/package/wpewebkit/wpewebkit.hash
index 5e22845a59..2bd5fd3fba 100644
--- a/package/wpewebkit/wpewebkit.hash
+++ b/package/wpewebkit/wpewebkit.hash
@@ -1,7 +1,7 @@
-# From https://wpewebkit.org/releases/wpewebkit-2.30.1.tar.xz.sums
-md5  251228a6e2917eff90a3eb6e9a7e920d  wpewebkit-2.30.1.tar.xz
-sha1  7f5bdc79d4694ab5644b7fed9bd7311c2cbc988f  wpewebkit-2.30.1.tar.xz
-sha256  78c0135d935b980fc64fbddf1fbaf441920edda4eeb4c16857ee8dc985650c25  wpewebkit-2.30.1.tar.xz
+# From https://wpewebkit.org/releases/wpewebkit-2.30.2.tar.xz.sums
+md5  5b0fed3333b53dbb36e572935fd54a7b  wpewebkit-2.30.2.tar.xz
+sha1  a143723fb77c2ea20bad888b95ccc37a7dd5b375  wpewebkit-2.30.2.tar.xz
+sha256  c94925ca2d655c7fc07dbc2d4b7a47a822c7699816a8cca35ed9efd676b5ba86  wpewebkit-2.30.2.tar.xz
 
 # Hashes for license files:
 sha256  0b5d3a7cc325942567373b0ecd757d07c132e0ebd7c97bfc63f7e1a76094edb4  Source/WebCore/LICENSE-APPLE
diff --git a/package/wpewebkit/wpewebkit.mk b/package/wpewebkit/wpewebkit.mk
index e1e9ceea76..6233505ca7 100644
--- a/package/wpewebkit/wpewebkit.mk
+++ b/package/wpewebkit/wpewebkit.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WPEWEBKIT_VERSION = 2.30.1
+WPEWEBKIT_VERSION = 2.30.2
 WPEWEBKIT_SITE = http://www.wpewebkit.org/releases
 WPEWEBKIT_SOURCE = wpewebkit-$(WPEWEBKIT_VERSION).tar.xz
 WPEWEBKIT_INSTALL_STAGING = YES
