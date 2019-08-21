From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed, 21 Aug 2019 20:24:34 +0200
Subject: [Buildroot] [PATCH 1/1] package/clamav: security bump version to
 0.101.4
Message-ID: <20190821182434.26342-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes CVE-2019-12900 and adds an additional fix for CVE-2019-12625.

Release notes:
https://blog.clamav.net/2019/08/clamav-01014-security-patch-release-has.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/clamav/clamav.hash | 2 +-
 package/clamav/clamav.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/clamav/clamav.hash b/package/clamav/clamav.hash
index ee77045f28..1246f4febf 100644
--- a/package/clamav/clamav.hash
+++ b/package/clamav/clamav.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256 68d42aac4a9cbde293288533a9a3c3d55863de38f2b8707c1ef2d987b1260338  clamav-0.101.3.tar.gz
+sha256 0bf094f0919d158a578421d66bc2569c8c8181233ba162bb51722f98c802bccd  clamav-0.101.4.tar.gz
 sha256 0c4fd2fa9733fc9122503797648710851e4ee6d9e4969dd33fcbd8c63cd2f584  COPYING
 sha256 d72a145c90918184a05ef65a04c9e6f7466faa59bc1b82c8f6a8ddc7ddcb9bed  COPYING.bzip2
 sha256 dfb818a0d41411c6fb1c193c68b73018ceadd1994bda41ad541cbff292894bc6  COPYING.file
diff --git a/package/clamav/clamav.mk b/package/clamav/clamav.mk
index 698094d44a..03ce4136a7 100644
--- a/package/clamav/clamav.mk
+++ b/package/clamav/clamav.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CLAMAV_VERSION = 0.101.3
+CLAMAV_VERSION = 0.101.4
 CLAMAV_SITE = https://www.clamav.net/downloads/production
 CLAMAV_LICENSE = GPL-2.0
 CLAMAV_LICENSE_FILES = COPYING COPYING.bzip2 COPYING.file COPYING.getopt \
-- 
2.20.1
