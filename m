From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 26 Apr 2020 15:56:15 -0600
Subject: [Buildroot] [PATCH 1/1] package/meson: bump to version 0.54.1
Message-ID: <20200426215615.94066-1-james.hilliard1@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/meson/meson.hash | 4 ++--
 package/meson/meson.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/meson/meson.hash b/package/meson/meson.hash
index bbb031957b..1fb902742d 100644
--- a/package/meson/meson.hash
+++ b/package/meson/meson.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-# https://github.com/mesonbuild/meson/releases/download/0.54.0/meson-0.54.0.tar.gz.asc
-sha256  dde5726d778112acbd4a67bb3633ab2ee75d33d1e879a6283a7b4a44c3363c27  meson-0.54.0.tar.gz
+# https://github.com/mesonbuild/meson/releases/download/0.54.1/meson-0.54.1.tar.gz.asc
+sha256  2f76fb4572762be13ee479292610091b4509af5788bcceb391fe222bcd0296dc  meson-0.54.1.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  COPYING
diff --git a/package/meson/meson.mk b/package/meson/meson.mk
index 2e6c4cea71..fea2807d9f 100644
--- a/package/meson/meson.mk
+++ b/package/meson/meson.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MESON_VERSION = 0.54.0
+MESON_VERSION = 0.54.1
 MESON_SITE = https://github.com/mesonbuild/meson/releases/download/$(MESON_VERSION)
 MESON_LICENSE = Apache-2.0
 MESON_LICENSE_FILES = COPYING
-- 
2.20.1
