From: Gwenhael Goavec-Merou <gwenj@trabucayre.com>
Date: Mon, 28 Jun 2021 11:51:59 +0200
Subject: [Buildroot] [PATCH] package/matio: Bump version to 1.5.21
Message-ID: <20210628095159.1416239-1-gwenj@trabucayre.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>

Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
---
 package/matio/matio.hash | 4 ++--
 package/matio/matio.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/matio/matio.hash b/package/matio/matio.hash
index 55e57338c8..619a63ac1d 100644
--- a/package/matio/matio.hash
+++ b/package/matio/matio.hash
@@ -1,4 +1,4 @@
-# From https://sourceforge.net/projects/matio/files/matio/1.5.18/
-sha512  c43e562a101348d64139a056f28bce37c59c6667d701200255ccf9d8b6adf7a92ae9c11c8d921ec8a652cdc81c5de9ab247907279c54c52905adfd65bc3fb90f  matio-1.5.18.tar.gz
+# From https://sourceforge.net/projects/matio/files/matio/1.5.21/
+sha512  b00bcad807e6a7e10afa656eb77a0e3e9fb08d9cecc3e94ba41ef91ce60367d6686e6d387a874bbb83eb2f895d4a97caac554a70e7f5f6f5cb750052702d411c  matio-1.5.21.tar.gz
 # Locally computed
 sha256  19494e9c9154a5e3f834e99d65fab0653b84280df7c98d1886a98d2bd28369c1  COPYING
diff --git a/package/matio/matio.mk b/package/matio/matio.mk
index 0ebba13435..236466d4d9 100644
--- a/package/matio/matio.mk
+++ b/package/matio/matio.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MATIO_VERSION = 1.5.18
+MATIO_VERSION = 1.5.21
 MATIO_SITE = http://downloads.sourceforge.net/project/matio/matio/$(MATIO_VERSION)
 MATIO_LICENSE = BSD-2-Clause
 MATIO_LICENSE_FILES = COPYING
-- 
2.20.1
