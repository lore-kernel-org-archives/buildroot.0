From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Wed,  8 Jun 2016 12:15:12 +0200
Subject: [Buildroot] [PATCH] libftdi1: bump to version 1.3
Message-ID: <1465380912-25163-1-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/libftdi1/libftdi1.hash | 2 +-
 package/libftdi1/libftdi1.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libftdi1/libftdi1.hash b/package/libftdi1/libftdi1.hash
index e53bc8f..0a89182 100644
--- a/package/libftdi1/libftdi1.hash
+++ b/package/libftdi1/libftdi1.hash
@@ -1,2 +1,2 @@
 # Locally computed (after checking the signature from http://www.intra2net.com/en/developer/libftdi/download.php)
-sha256  a6ea795c829219015eb372b03008351cee3fb39f684bff3bf8a4620b558488d6  libftdi1-1.2.tar.bz2
+sha256  9a8c95c94bfbcf36584a0a58a6e2003d9b133213d9202b76aec76302ffaa81f4  libftdi1-1.3.tar.bz2
diff --git a/package/libftdi1/libftdi1.mk b/package/libftdi1/libftdi1.mk
index e77f37b..26aa293 100644
--- a/package/libftdi1/libftdi1.mk
+++ b/package/libftdi1/libftdi1.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBFTDI1_VERSION = 1.2
+LIBFTDI1_VERSION = 1.3
 LIBFTDI1_SOURCE = libftdi1-$(LIBFTDI1_VERSION).tar.bz2
 LIBFTDI1_SITE = http://www.intra2net.com/en/developer/libftdi/download
 LIBFTDI1_INSTALL_STAGING = YES
-- 
2.1.4
