From: Sergio Prado <sergio.prado@e-labworks.com>
Date: Sat, 18 Jul 2020 06:40:37 -0300
Subject: [Buildroot] [PATCH] package/armadillo: bump version to 9.900.2
Message-ID: <20200718094037.14072-1-sergio.prado@e-labworks.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also remove upstream hashes not available anymore.

Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>
---
 package/armadillo/armadillo.hash | 5 +----
 package/armadillo/armadillo.mk   | 2 +-
 2 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/package/armadillo/armadillo.hash b/package/armadillo/armadillo.hash
index aa2157080398..cc91fb456aa0 100644
--- a/package/armadillo/armadillo.hash
+++ b/package/armadillo/armadillo.hash
@@ -1,7 +1,4 @@
-# From http://sourceforge.net/projects/arma/files/?source=navbar
-md5  12c3b63c301d414659d7592ff58a71cb  armadillo-9.850.1.tar.xz
-sha1  0a2d3ef140fd8587867def7359fe45f9df4a925a  armadillo-9.850.1.tar.xz
 # Locally computed:
-sha256  d4c389b9597a5731500ad7a2656c11a6031757aaaadbcafdea5cc8ac0fd2c01f  armadillo-9.850.1.tar.xz
+sha256  d78658c9442addf7f718eb05881150ee3ec25604d06dd3af4942422b3ce26d05  armadillo-9.900.2.tar.xz
 # License files, locally calculated
 sha256  3ddf9be5c28fe27dad143a5dc76eea25222ad1dd68934a047064e56ed2fa40c5  LICENSE.txt
diff --git a/package/armadillo/armadillo.mk b/package/armadillo/armadillo.mk
index f693d8c9465b..624b842ef6f3 100644
--- a/package/armadillo/armadillo.mk
+++ b/package/armadillo/armadillo.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ARMADILLO_VERSION = 9.850.1
+ARMADILLO_VERSION = 9.900.2
 ARMADILLO_SOURCE = armadillo-$(ARMADILLO_VERSION).tar.xz
 ARMADILLO_SITE = https://downloads.sourceforge.net/project/arma
 ARMADILLO_DEPENDENCIES = clapack
-- 
2.17.1
