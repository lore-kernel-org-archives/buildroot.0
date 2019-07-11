From: aduskett at gmail.com <aduskett@gmail.com>
Date: Thu, 11 Jul 2019 11:10:20 -0400
Subject: [Buildroot] [PATCH 1/1] package/meson: bump version to 0.51.1
In-Reply-To: <20190711151020.55218-1-aduskett@gmail.com>
References: <20190711151020.55218-1-aduskett@gmail.com>
Message-ID: <20190711151020.55218-2-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
---
 package/meson/meson.hash | 4 ++--
 package/meson/meson.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/meson/meson.hash b/package/meson/meson.hash
index da031e8cd7..80828b2a17 100644
--- a/package/meson/meson.hash
+++ b/package/meson/meson.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-# https://github.com/mesonbuild/meson/releases/download/0.51.0/meson-0.51.0.tar.gz.asc
-sha256 2f75fdf6d586d3595c03a07afcd0eaae11f68dd33fea5906a434d22a409ed63f meson-0.51.0.tar.gz
+# https://github.com/mesonbuild/meson/releases/download/0.51.1/meson-0.51.1.tar.gz.asc
+sha256 f27b7a60f339ba66fe4b8f81f0d1072e090a08eabbd6aa287683b2c2b9dd2d82 meson-0.51.1.tar.gz
 sha256 cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30 COPYING
diff --git a/package/meson/meson.mk b/package/meson/meson.mk
index dffa301191..3267581fc6 100644
--- a/package/meson/meson.mk
+++ b/package/meson/meson.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MESON_VERSION = 0.51.0
+MESON_VERSION = 0.51.1
 MESON_SITE = https://github.com/mesonbuild/meson/releases/download/$(MESON_VERSION)
 MESON_LICENSE = Apache-2.0
 MESON_LICENSE_FILES = COPYING
-- 
2.21.0
