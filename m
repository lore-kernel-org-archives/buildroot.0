From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 24 Apr 2019 21:48:26 +0200
Subject: [Buildroot] [git commit] package/meson: bump to version 0.50.1
Message-ID: <20190424194448.7E95D826D0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=70fb5e610761dd6468a058c580acc3d4f81fe547
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Tested against systemd and glib-networking.

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
[Thomas: use the upstream-uploaded tarball and not the github macro,
which allows to have the tarball that really matches upstream's GPG
signature]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/meson/meson.hash | 4 ++--
 package/meson/meson.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/meson/meson.hash b/package/meson/meson.hash
index fadef6df8a..9e60fa6349 100644
--- a/package/meson/meson.hash
+++ b/package/meson/meson.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-# https://github.com/mesonbuild/meson/releases/download/0.49.2/meson-0.49.2.tar.gz.asc
-sha256 ef9f14326ec1e30d3ba1a26df0f92826ede5a79255ad723af78a2691c37109fd meson-0.49.2.tar.gz
+# https://github.com/mesonbuild/meson/releases/download/0.50.1/meson-0.50.1.tar.gz.asc
+sha256 f68f56d60c80a77df8fc08fa1016bc5831605d4717b622c96212573271e14ecc meson-0.50.1.tar.gz
 sha256 cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30 COPYING
diff --git a/package/meson/meson.mk b/package/meson/meson.mk
index 49e27f5527..cf62b0ddde 100644
--- a/package/meson/meson.mk
+++ b/package/meson/meson.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MESON_VERSION = 0.49.2
+MESON_VERSION = 0.50.1
 MESON_SITE = https://github.com/mesonbuild/meson/releases/download/$(MESON_VERSION)
 MESON_LICENSE = Apache-2.0
 MESON_LICENSE_FILES = COPYING
