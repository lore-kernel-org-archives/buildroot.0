From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 16 Oct 2019 21:56:19 +0200
Subject: [Buildroot] [git commit] package/meson: bump to version 0.52.0
Message-ID: <20191016200044.F38C1812B1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4c27fee9f7034bee542cb8d192632e6eb13d6c37
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/meson/meson.hash | 4 ++--
 package/meson/meson.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/meson/meson.hash b/package/meson/meson.hash
index cfe859d2ee..26b1fc9bb2 100644
--- a/package/meson/meson.hash
+++ b/package/meson/meson.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-# https://github.com/mesonbuild/meson/releases/download/0.51.2/meson-0.51.2.tar.gz.asc
-sha256 23688f0fc90be623d98e80e1defeea92bbb7103bf9336a5f5b9865d36e892d76 meson-0.51.2.tar.gz
+# https://github.com/mesonbuild/meson/releases/download/0.52.0/meson-0.52.0.tar.gz.asc
+sha256 d60f75f0dedcc4fd249dbc7519d6f3ce6df490033d276ef1cf27453ef4938d32 meson-0.52.0.tar.gz
 sha256 cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30 COPYING
diff --git a/package/meson/meson.mk b/package/meson/meson.mk
index a664c55f55..29a192c569 100644
--- a/package/meson/meson.mk
+++ b/package/meson/meson.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MESON_VERSION = 0.51.2
+MESON_VERSION = 0.52.0
 MESON_SITE = https://github.com/mesonbuild/meson/releases/download/$(MESON_VERSION)
 MESON_LICENSE = Apache-2.0
 MESON_LICENSE_FILES = COPYING
