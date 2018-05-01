From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue,  1 May 2018 14:59:56 +0200
Subject: [Buildroot] [PATCH 1/1] lftp: bump to version 4.8.3
Message-ID: <20180501125956.28230-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add hash for license file

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/lftp/lftp.hash | 9 ++++++---
 package/lftp/lftp.mk   | 2 +-
 2 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/package/lftp/lftp.hash b/package/lftp/lftp.hash
index 99dd994fdd..7828cca9c1 100644
--- a/package/lftp/lftp.hash
+++ b/package/lftp/lftp.hash
@@ -1,4 +1,7 @@
-# From http://lftp.yar.ru/ftp/lftp-4.8.0.md5sum
-md5 468558412ad3575ef8e98547c41339f4  lftp-4.8.0.tar.xz
+# From http://lftp.yar.ru/ftp/lftp-4.8.3.md5sum
+md5 8beb3d814d60f52ac70cffd6dff23d85  lftp-4.8.3.tar.xz
 # Locally calculated after checking gpg signature
-sha256 7a2880968088b4aeec43b6b6680fef0e065e1dddcce9b409390157e9766b690f  lftp-4.8.0.tar.xz
+sha256 de7aee451afaa1aa391f7076b5f602922c2da0e05524a8d8fea413eda83cc78b  lftp-4.8.3.tar.xz
+
+# Hash for license file:
+sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/lftp/lftp.mk b/package/lftp/lftp.mk
index b174057f03..e1ca0533ee 100644
--- a/package/lftp/lftp.mk
+++ b/package/lftp/lftp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LFTP_VERSION = 4.8.0
+LFTP_VERSION = 4.8.3
 LFTP_SOURCE = lftp-$(LFTP_VERSION).tar.xz
 LFTP_SITE = http://lftp.yar.ru/ftp
 LFTP_LICENSE = GPL-3.0+
-- 
2.14.1
