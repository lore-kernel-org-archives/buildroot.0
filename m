From: Adam Duskett <aduskett@gmail.com>
Date: Fri, 29 Dec 2017 17:07:24 -0500
Subject: [Buildroot] [PATCH 1/1] meson: bump to 0.44.0
Message-ID: <20171229220724.7889-1-Adamduskett@outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also add a hash for the license file.

Signed-off-by: Adam Duskett <Adamduskett@outlook.com>
---
 package/meson/meson.hash | 5 +++--
 package/meson/meson.mk   | 2 +-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/meson/meson.hash b/package/meson/meson.hash
index 412c10eb2f..279dd93a51 100644
--- a/package/meson/meson.hash
+++ b/package/meson/meson.hash
@@ -1,3 +1,4 @@
 # Locally calculated after checking pgp signature
-# https://github.com/mesonbuild/meson/releases/download/0.43.0/meson-0.43.0.tar.gz.asc
-sha256 c513eca90e0d70bf14cd1eaafea2fa91cf40a73326a7ff61f08a005048057340  meson-0.43.0.tar.gz
+# https://github.com/mesonbuild/meson/releases/download/0.44.0/meson-0.44.0.tar.gz.asc
+sha256	50f9b12b77272ef6ab064d26b7e06667f07fa9f931e6a20942bba2216ba4281b	meson-0.44.0.tar.gz
+sha256	cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30	COPYING
diff --git a/package/meson/meson.mk b/package/meson/meson.mk
index 75b9a1666a..cf24ed1336 100644
--- a/package/meson/meson.mk
+++ b/package/meson/meson.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MESON_VERSION = 0.43.0
+MESON_VERSION = 0.44.0
 MESON_SITE = https://github.com/mesonbuild/meson/releases/download/$(MESON_VERSION)
 MESON_LICENSE = Apache-2.0
 MESON_LICENSE_FILES = COPYING
-- 
2.14.3
