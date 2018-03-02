From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Fri,  2 Mar 2018 07:06:57 +0100
Subject: [Buildroot] [PATCH 1/1] package/clamav: security bump to version
 0.99.4
Message-ID: <20180302060657.9454-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes CVE-2012-6706, CVE-2017-6419, CVE-2017-11423, CVE-2018-1000085 &
CVE-2018-0202.

For details see upstream announcement:
http://lists.clamav.net/pipermail/clamav-announce/2018/000029.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/clamav/clamav.hash | 2 +-
 package/clamav/clamav.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/clamav/clamav.hash b/package/clamav/clamav.hash
index fe873bddfc..76c633f979 100644
--- a/package/clamav/clamav.hash
+++ b/package/clamav/clamav.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256 00fa5292a6e00a3a4035b826267748965d5d2c4943d8ff417d740238263e8e84  clamav-0.99.3.tar.gz
+sha256 d72ac3273bde8d2e5e28ec9978373ee3ab4529fd868bc3fc4d2d2671228f2461  clamav-0.99.4.tar.gz
 sha256 0c4fd2fa9733fc9122503797648710851e4ee6d9e4969dd33fcbd8c63cd2f584  COPYING
 sha256 d72a145c90918184a05ef65a04c9e6f7466faa59bc1b82c8f6a8ddc7ddcb9bed  COPYING.bzip2
 sha256 dfb818a0d41411c6fb1c193c68b73018ceadd1994bda41ad541cbff292894bc6  COPYING.file
diff --git a/package/clamav/clamav.mk b/package/clamav/clamav.mk
index d53168fc1b..4c4fc395c2 100644
--- a/package/clamav/clamav.mk
+++ b/package/clamav/clamav.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CLAMAV_VERSION = 0.99.3
+CLAMAV_VERSION = 0.99.4
 CLAMAV_SITE = https://www.clamav.net/downloads/production
 CLAMAV_LICENSE = GPL-2.0
 CLAMAV_LICENSE_FILES = COPYING COPYING.bzip2 COPYING.file COPYING.getopt \
-- 
2.11.0
