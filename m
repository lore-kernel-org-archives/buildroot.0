From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Wed, 26 Feb 2020 14:05:09 +0100
Subject: [Buildroot] [PATCH/next 1/1] package/armadillo: bump to version
 9.850.1
Message-ID: <20200226130509.1912690-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Update indentation of hash file (two spaces)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/armadillo/armadillo.hash | 8 ++++----
 package/armadillo/armadillo.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/armadillo/armadillo.hash b/package/armadillo/armadillo.hash
index 6b3c4a855f..aa21570803 100644
--- a/package/armadillo/armadillo.hash
+++ b/package/armadillo/armadillo.hash
@@ -1,7 +1,7 @@
 # From http://sourceforge.net/projects/arma/files/?source=navbar
-md5 5ef71763bd429a3d481499878351f3be  armadillo-7.900.1.tar.xz
-sha1 8118faf1c6a7a39c55a1103a1f90e85e613cc377  armadillo-7.900.1.tar.xz
+md5  12c3b63c301d414659d7592ff58a71cb  armadillo-9.850.1.tar.xz
+sha1  0a2d3ef140fd8587867def7359fe45f9df4a925a  armadillo-9.850.1.tar.xz
 # Locally computed:
-sha256 33eec7013990b5477ccc5ad3abc68bc2326c7a7a2790014d625cfcf37c0e07d3  armadillo-7.900.1.tar.xz
+sha256  d4c389b9597a5731500ad7a2656c11a6031757aaaadbcafdea5cc8ac0fd2c01f  armadillo-9.850.1.tar.xz
 # License files, locally calculated
-sha256 3ddf9be5c28fe27dad143a5dc76eea25222ad1dd68934a047064e56ed2fa40c5  LICENSE.txt
+sha256  3ddf9be5c28fe27dad143a5dc76eea25222ad1dd68934a047064e56ed2fa40c5  LICENSE.txt
diff --git a/package/armadillo/armadillo.mk b/package/armadillo/armadillo.mk
index 5d9e3eda57..d9a28e9878 100644
--- a/package/armadillo/armadillo.mk
+++ b/package/armadillo/armadillo.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ARMADILLO_VERSION = 7.900.1
+ARMADILLO_VERSION = 9.850.1
 ARMADILLO_SOURCE = armadillo-$(ARMADILLO_VERSION).tar.xz
 ARMADILLO_SITE = https://downloads.sourceforge.net/project/arma
 ARMADILLO_DEPENDENCIES = clapack
-- 
2.25.0
