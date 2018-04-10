From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Tue, 10 Apr 2018 20:33:03 +0200
Subject: [Buildroot] [PATCH 1/1] package/clamav: bump version to 0.100.0
Message-ID: <20180410183303.32464-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Release notes:
http://lists.clamav.net/pipermail/clamav-announce/2018/000031.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/clamav/clamav.hash | 2 +-
 package/clamav/clamav.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/clamav/clamav.hash b/package/clamav/clamav.hash
index 76c633f979..4cf7e7a542 100644
--- a/package/clamav/clamav.hash
+++ b/package/clamav/clamav.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256 d72ac3273bde8d2e5e28ec9978373ee3ab4529fd868bc3fc4d2d2671228f2461  clamav-0.99.4.tar.gz
+sha256 c5c5edaf75a3c53ac0f271148fd6447310bce53f448ec7e6205124a25918f65c  clamav-0.100.0.tar.gz
 sha256 0c4fd2fa9733fc9122503797648710851e4ee6d9e4969dd33fcbd8c63cd2f584  COPYING
 sha256 d72a145c90918184a05ef65a04c9e6f7466faa59bc1b82c8f6a8ddc7ddcb9bed  COPYING.bzip2
 sha256 dfb818a0d41411c6fb1c193c68b73018ceadd1994bda41ad541cbff292894bc6  COPYING.file
diff --git a/package/clamav/clamav.mk b/package/clamav/clamav.mk
index 4c4fc395c2..2711ca2a86 100644
--- a/package/clamav/clamav.mk
+++ b/package/clamav/clamav.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CLAMAV_VERSION = 0.99.4
+CLAMAV_VERSION = 0.100.0
 CLAMAV_SITE = https://www.clamav.net/downloads/production
 CLAMAV_LICENSE = GPL-2.0
 CLAMAV_LICENSE_FILES = COPYING COPYING.bzip2 COPYING.file COPYING.getopt \
-- 
2.14.2
