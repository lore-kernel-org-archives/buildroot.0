From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 28 Sep 2016 07:47:01 -0300
Subject: [Buildroot] [PATCH] mpfr: bump to version 3.1.5
Message-ID: <1475059621-25540-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/mpfr/mpfr.hash | 2 +-
 package/mpfr/mpfr.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mpfr/mpfr.hash b/package/mpfr/mpfr.hash
index a8b642b..d2c32f2 100644
--- a/package/mpfr/mpfr.hash
+++ b/package/mpfr/mpfr.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256	761413b16d749c53e2bfd2b1dfaa3b027b0e793e404b90b5fbaeef60af6517f5	mpfr-3.1.4.tar.xz
+sha256	015fde82b3979fbe5f83501986d328331ba8ddf008c1ff3da3c238f49ca062bc	mpfr-3.1.5.tar.xz
diff --git a/package/mpfr/mpfr.mk b/package/mpfr/mpfr.mk
index cc1034c..bb78ccc 100644
--- a/package/mpfr/mpfr.mk
+++ b/package/mpfr/mpfr.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MPFR_VERSION = 3.1.4
+MPFR_VERSION = 3.1.5
 MPFR_SITE = http://www.mpfr.org/mpfr-$(MPFR_VERSION)
 MPFR_SOURCE = mpfr-$(MPFR_VERSION).tar.xz
 MPFR_LICENSE = LGPLv3+
-- 
2.7.3
