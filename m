From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 23 Jun 2010 11:27:29 +0200
Subject: [Buildroot] [git commit master 1/1] defconfigs: use the default
	BR2_JLEVEL setting (2)
Message-ID: <20100623092838.203DD81886@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=bec212eb49d15a8a5e29207ef6d96b87e91d2c89
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 configs/at91sam9260pf_defconfig      |    2 +-
 configs/atngw100-base_defconfig      |    2 +-
 configs/atngw100_defconfig           |    2 +-
 configs/i386_defconfig               |    2 +-
 configs/i686_defconfig               |    2 +-
 configs/integrator926_defconfig      |    2 +-
 configs/integrator926_huge_defconfig |    2 +-
 configs/kb9202_defconfig             |    2 +-
 configs/v100sc2_defconfig            |    2 +-
 9 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/configs/at91sam9260pf_defconfig b/configs/at91sam9260pf_defconfig
index b8ab5ac..d444158 100644
--- a/configs/at91sam9260pf_defconfig
+++ b/configs/at91sam9260pf_defconfig
@@ -72,7 +72,7 @@ BR2_AT91_PATCH_MIRROR="http://maxim.org.za/AT91RM9200/2.6/"
 BR2_STAGING_DIR="$(BASE_DIR)/staging"
 BR2_TOPDIR_PREFIX=""
 BR2_TOPDIR_SUFFIX="wchar"
-BR2_JLEVEL=1
+BR2_JLEVEL=2
 # BR2_DEPRECATED is not set
 BR2_STRIP_strip=y
 # BR2_STRIP_sstrip is not set
diff --git a/configs/atngw100-base_defconfig b/configs/atngw100-base_defconfig
index b839703..8c3d80b 100644
--- a/configs/atngw100-base_defconfig
+++ b/configs/atngw100-base_defconfig
@@ -111,7 +111,7 @@ BR2_STAGING_DIR="$(BASE_DIR)/staging"
 # BR2_FPU_SUFFIX is not set
 BR2_TOPDIR_PREFIX=""
 BR2_TOPDIR_SUFFIX=""
-BR2_JLEVEL=1
+BR2_JLEVEL=2
 # BR2_DEPRECATED is not set
 # BR2_CONFIG_CACHE is not set
 # BR2_ENABLE_DEBUG is not set
diff --git a/configs/atngw100_defconfig b/configs/atngw100_defconfig
index a70a9f9..763cad7 100644
--- a/configs/atngw100_defconfig
+++ b/configs/atngw100_defconfig
@@ -91,7 +91,7 @@ BR2_GNU_MIRROR="http://ftp.gnu.org/pub/gnu"
 BR2_DEBIAN_MIRROR="http://ftp.debian.org"
 BR2_ATMEL_MIRROR="ftp://www.at91.com/pub/buildroot/"
 BR2_AT91_PATCH_MIRROR="http://maxim.org.za/AT91RM9200/2.6/"
-BR2_JLEVEL=3
+BR2_JLEVEL=2
 # BR2_DEPRECATED is not set
 # BR2_ENABLE_DEBUG is not set
 BR2_STRIP_strip=y
diff --git a/configs/i386_defconfig b/configs/i386_defconfig
index 4f8a290..69e6412 100644
--- a/configs/i386_defconfig
+++ b/configs/i386_defconfig
@@ -112,7 +112,7 @@ BR2_STAGING_DIR="$(BASE_DIR)/staging"
 # BR2_FPU_SUFFIX is not set
 BR2_TOPDIR_PREFIX=""
 BR2_TOPDIR_SUFFIX=""
-BR2_JLEVEL=1
+BR2_JLEVEL=2
 # BR2_DEPRECATED is not set
 # BR2_CONFIG_CACHE is not set
 # BR2_ENABLE_DEBUG is not set
diff --git a/configs/i686_defconfig b/configs/i686_defconfig
index 7a9d025..e4d4f98 100644
--- a/configs/i686_defconfig
+++ b/configs/i686_defconfig
@@ -112,7 +112,7 @@ BR2_STAGING_DIR="$(BASE_DIR)/staging"
 # BR2_FPU_SUFFIX is not set
 BR2_TOPDIR_PREFIX=""
 BR2_TOPDIR_SUFFIX=""
-BR2_JLEVEL=1
+BR2_JLEVEL=2
 # BR2_DEPRECATED is not set
 # BR2_CONFIG_CACHE is not set
 # BR2_ENABLE_DEBUG is not set
diff --git a/configs/integrator926_defconfig b/configs/integrator926_defconfig
index b7f0c1d..cb83023 100644
--- a/configs/integrator926_defconfig
+++ b/configs/integrator926_defconfig
@@ -109,7 +109,7 @@ BR2_STAGING_DIR="$(BASE_DIR)/staging"
 BR2_TOPDIR_PREFIX=""
 BR2_TOPDIR_SUFFIX=""
 BR2_ROOTFS_PREFIX="rootfs"
-BR2_JLEVEL=1
+BR2_JLEVEL=2
 # BR2_DEPRECATED is not set
 # BR2_CONFIG_CACHE is not set
 # BR2_ENABLE_DEBUG is not set
diff --git a/configs/integrator926_huge_defconfig b/configs/integrator926_huge_defconfig
index e4c15fd..f9d05c0 100644
--- a/configs/integrator926_huge_defconfig
+++ b/configs/integrator926_huge_defconfig
@@ -109,7 +109,7 @@ BR2_STAGING_DIR="$(BASE_DIR)/staging"
 BR2_TOPDIR_PREFIX=""
 BR2_TOPDIR_SUFFIX=""
 BR2_ROOTFS_PREFIX="$(BOARD_NAME)-rootfs"
-BR2_JLEVEL=1
+BR2_JLEVEL=2
 # BR2_DEPRECATED is not set
 # BR2_CONFIG_CACHE is not set
 # BR2_ENABLE_DEBUG is not set
diff --git a/configs/kb9202_defconfig b/configs/kb9202_defconfig
index 4c84b9e..9300f28 100644
--- a/configs/kb9202_defconfig
+++ b/configs/kb9202_defconfig
@@ -118,7 +118,7 @@ BR2_STAGING_DIR="$(BASE_DIR)/staging"
 BR2_TOPDIR_PREFIX=""
 BR2_TOPDIR_SUFFIX=""
 BR2_ROOTFS_PREFIX="rootfs"
-BR2_JLEVEL=1
+BR2_JLEVEL=2
 # BR2_DEPRECATED is not set
 # BR2_ENABLE_DEBUG is not set
 BR2_STRIP_strip=y
diff --git a/configs/v100sc2_defconfig b/configs/v100sc2_defconfig
index 1ee7a9e..c85a4d8 100644
--- a/configs/v100sc2_defconfig
+++ b/configs/v100sc2_defconfig
@@ -89,7 +89,7 @@ BR2_STAGING_DIR="$(BASE_DIR)/staging"
 BR2_TOPDIR_PREFIX=""
 BR2_TOPDIR_SUFFIX=""
 BR2_ROOTFS_PREFIX="rootfs"
-BR2_JLEVEL=1
+BR2_JLEVEL=2
 # BR2_DEPRECATED is not set
 # BR2_ENABLE_DEBUG is not set
 BR2_STRIP_strip=y
-- 
1.7.1
