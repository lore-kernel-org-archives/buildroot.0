From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 28 Aug 2017 08:34:16 +0300
Subject: [Buildroot] [PATCH next 2/2] libftdi1: bump to version 1.4
In-Reply-To: <c21debe1fe36162b182803d45b5e6b0ab4ff575d.1503898456.git.baruch@tkos.co.il>
References: <c21debe1fe36162b182803d45b5e6b0ab4ff575d.1503898456.git.baruch@tkos.co.il>
Message-ID: <1899b78d8e175b669b6feadcad538baf7f119c68.1503898456.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Cc: Daniel Sangue <daniel.sangue@sangue.ch>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/libftdi1/libftdi1.hash | 5 +++--
 package/libftdi1/libftdi1.mk   | 2 +-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/libftdi1/libftdi1.hash b/package/libftdi1/libftdi1.hash
index 0a89182449c1..40512a7fc302 100644
--- a/package/libftdi1/libftdi1.hash
+++ b/package/libftdi1/libftdi1.hash
@@ -1,2 +1,3 @@
-# Locally computed (after checking the signature from http://www.intra2net.com/en/developer/libftdi/download.php)
-sha256  9a8c95c94bfbcf36584a0a58a6e2003d9b133213d9202b76aec76302ffaa81f4  libftdi1-1.3.tar.bz2
+# Locally computed after checking the signature
+# https://www.intra2net.com/en/developer/libftdi/download/libftdi1-1.4.tar.bz2.sig
+sha256  ec36fb49080f834690c24008328a5ef42d3cf584ef4060f3a35aa4681cb31b74  libftdi1-1.4.tar.bz2
diff --git a/package/libftdi1/libftdi1.mk b/package/libftdi1/libftdi1.mk
index 6b84b953170f..c45c83a71116 100644
--- a/package/libftdi1/libftdi1.mk
+++ b/package/libftdi1/libftdi1.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBFTDI1_VERSION = 1.3
+LIBFTDI1_VERSION = 1.4
 LIBFTDI1_SOURCE = libftdi1-$(LIBFTDI1_VERSION).tar.bz2
 LIBFTDI1_SITE = http://www.intra2net.com/en/developer/libftdi/download
 LIBFTDI1_INSTALL_STAGING = YES
-- 
2.14.1
