From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 18 Dec 2019 23:23:24 +0100
Subject: [Buildroot] [git commit] package/meson: bump to version 0.52.1
Message-ID: <20191218221430.259968C9BA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9b63f630e2ad2748a66dd8829887a66fc8aebe74
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/meson/meson.hash | 4 ++--
 package/meson/meson.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/meson/meson.hash b/package/meson/meson.hash
index 26b1fc9bb2..461e908b4a 100644
--- a/package/meson/meson.hash
+++ b/package/meson/meson.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-# https://github.com/mesonbuild/meson/releases/download/0.52.0/meson-0.52.0.tar.gz.asc
-sha256 d60f75f0dedcc4fd249dbc7519d6f3ce6df490033d276ef1cf27453ef4938d32 meson-0.52.0.tar.gz
+# https://github.com/mesonbuild/meson/releases/download/0.52.1/meson-0.52.1.tar.gz.asc
+sha256 0c277472e49950a5537e3de3e60c57b80dbf425788470a1a8ed27446128fc035 meson-0.52.1.tar.gz
 sha256 cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30 COPYING
diff --git a/package/meson/meson.mk b/package/meson/meson.mk
index c708532c6d..d409ae7b52 100644
--- a/package/meson/meson.mk
+++ b/package/meson/meson.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MESON_VERSION = 0.52.0
+MESON_VERSION = 0.52.1
 MESON_SITE = https://github.com/mesonbuild/meson/releases/download/$(MESON_VERSION)
 MESON_LICENSE = Apache-2.0
 MESON_LICENSE_FILES = COPYING
