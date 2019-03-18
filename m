From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 18 Mar 2019 22:59:03 +0100
Subject: [Buildroot] [git commit] package/meson: bump version to 0.50.0
Message-ID: <20190318215558.EC7A3890D9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=114e9dcd28e1001b74689215ec669b8940dc3ea9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/meson/meson.hash | 4 ++--
 package/meson/meson.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/meson/meson.hash b/package/meson/meson.hash
index fadef6df8a..e3d740b17c 100644
--- a/package/meson/meson.hash
+++ b/package/meson/meson.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-# https://github.com/mesonbuild/meson/releases/download/0.49.2/meson-0.49.2.tar.gz.asc
-sha256 ef9f14326ec1e30d3ba1a26df0f92826ede5a79255ad723af78a2691c37109fd meson-0.49.2.tar.gz
+# https://github.com/mesonbuild/meson/releases/download/0.50.0/meson-0.50.0.tar.gz.asc
+sha256 2a1bc42dda58206fb922cda5e1ca95cc03ad126321d26acc47d3493ec4e7021f meson-0.50.0.tar.gz
 sha256 cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30 COPYING
diff --git a/package/meson/meson.mk b/package/meson/meson.mk
index 49e27f5527..fbfef7002f 100644
--- a/package/meson/meson.mk
+++ b/package/meson/meson.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MESON_VERSION = 0.49.2
+MESON_VERSION = 0.50.0
 MESON_SITE = https://github.com/mesonbuild/meson/releases/download/$(MESON_VERSION)
 MESON_LICENSE = Apache-2.0
 MESON_LICENSE_FILES = COPYING
