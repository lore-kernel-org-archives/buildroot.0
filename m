From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 29 Dec 2017 23:30:52 +0100
Subject: [Buildroot] [git commit] meson: bump to 0.44.0
Message-ID: <20171229223103.68E0183849@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e416d5d9f4e5f6717db83926ec05a5ea0bada077
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also add a hash for the license file.

Signed-off-by: Adam Duskett <Adamduskett@outlook.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/meson/meson.hash | 5 +++--
 package/meson/meson.mk   | 2 +-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/meson/meson.hash b/package/meson/meson.hash
index 412c10e..279dd93 100644
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
index 55ce84d..a05969c 100644
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
