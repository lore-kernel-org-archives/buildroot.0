From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 8 Sep 2018 15:32:00 +0200
Subject: [Buildroot] [git commit] lftp: bump to version 4.8.4
Message-ID: <20180908133537.2231280030@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=28bd5ab5f14554db77d3b01587be92d2f48b8c3c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/lftp/lftp.hash | 6 +++---
 package/lftp/lftp.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/lftp/lftp.hash b/package/lftp/lftp.hash
index 7828cca9c1..64aba12b24 100644
--- a/package/lftp/lftp.hash
+++ b/package/lftp/lftp.hash
@@ -1,7 +1,7 @@
-# From http://lftp.yar.ru/ftp/lftp-4.8.3.md5sum
-md5 8beb3d814d60f52ac70cffd6dff23d85  lftp-4.8.3.tar.xz
+# From http://lftp.yar.ru/ftp/lftp-4.8.4.md5sum
+md5 b75c43797e817529d486be640232d708  lftp-4.8.4.tar.xz
 # Locally calculated after checking gpg signature
-sha256 de7aee451afaa1aa391f7076b5f602922c2da0e05524a8d8fea413eda83cc78b  lftp-4.8.3.tar.xz
+sha256 4ebc271e9e5cea84a683375a0f7e91086e5dac90c5d51bb3f169f75386107a62  lftp-4.8.4.tar.xz
 
 # Hash for license file:
 sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/lftp/lftp.mk b/package/lftp/lftp.mk
index 68f3dfce2c..93a0bf5c32 100644
--- a/package/lftp/lftp.mk
+++ b/package/lftp/lftp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LFTP_VERSION = 4.8.3
+LFTP_VERSION = 4.8.4
 LFTP_SOURCE = lftp-$(LFTP_VERSION).tar.xz
 LFTP_SITE = http://lftp.yar.ru/ftp
 LFTP_LICENSE = GPL-3.0+
