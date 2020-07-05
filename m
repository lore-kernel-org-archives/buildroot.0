From: Sergio Prado <sergio.prado@e-labworks.com>
Date: Sun,  5 Jul 2020 15:36:59 -0300
Subject: [Buildroot] [PATCH] package/check: bump version to 0.15.0
Message-ID: <20200705183659.7007-1-sergio.prado@e-labworks.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also separate the fields in the hash file by two spaces.

Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>
---
 package/check/check.hash | 4 ++--
 package/check/check.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/check/check.hash b/package/check/check.hash
index 52839a68b467..6287ddd1045e 100644
--- a/package/check/check.hash
+++ b/package/check/check.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256	bd0f0ca1be65b70238b32f8e9fe5d36dc2fbf7a759b7edf28e75323a7d74f30b	check-0.14.0.tar.gz
+sha256  aea2e3c68fa6e1e92378e744b1c0db350ccda4b6bd0d19530d0ae185b3d1ac60  check-0.15.0.tar.gz
 # License files, locally calculated
-sha256	a9bdde5616ecdd1e980b44f360600ee8783b1f99b8cc83a2beb163a0a390e861	COPYING.LESSER
+sha256  a9bdde5616ecdd1e980b44f360600ee8783b1f99b8cc83a2beb163a0a390e861  COPYING.LESSER
diff --git a/package/check/check.mk b/package/check/check.mk
index 6bec07adbdd5..bd3a1e6e06c4 100644
--- a/package/check/check.mk
+++ b/package/check/check.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CHECK_VERSION = 0.14.0
+CHECK_VERSION = 0.15.0
 CHECK_SITE = https://github.com/libcheck/check/releases/download/$(CHECK_VERSION)
 CHECK_INSTALL_STAGING = YES
 CHECK_DEPENDENCIES = host-pkgconf
-- 
2.17.1
