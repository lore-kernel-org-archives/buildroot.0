From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 19 Sep 2020 16:07:27 -0600
Subject: [Buildroot] [PATCH 1/1] package/meson: bump to version 0.55.3
Message-ID: <20200919220727.3488766-1-james.hilliard1@gmail.com>
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
index 331e50c038..9d278ef906 100644
--- a/package/meson/meson.hash
+++ b/package/meson/meson.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-# https://github.com/mesonbuild/meson/releases/download/0.55.1/meson-0.55.1.tar.gz.asc
-sha256  3b5741f884e04928bdfa1947467ff06afa6c98e623c25cef75adf71ca39ce080  meson-0.55.1.tar.gz
+# https://github.com/mesonbuild/meson/releases/download/0.55.3/meson-0.55.3.tar.gz.asc
+sha256  6bed2a25a128bbabe97cf40f63165ebe800e4fcb46db8ab7ef5c2b5789f092a5  meson-0.55.3.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  COPYING
diff --git a/package/meson/meson.mk b/package/meson/meson.mk
index 8b1bf1e58f..d39e66cf05 100644
--- a/package/meson/meson.mk
+++ b/package/meson/meson.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MESON_VERSION = 0.55.1
+MESON_VERSION = 0.55.3
 MESON_SITE = https://github.com/mesonbuild/meson/releases/download/$(MESON_VERSION)
 MESON_LICENSE = Apache-2.0
 MESON_LICENSE_FILES = COPYING
-- 
2.25.1
