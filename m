From: Pierre-Jean Texier <pjtexier@koncepto.io>
Date: Fri, 29 Nov 2019 14:51:15 +0100
Subject: [Buildroot] [PATCH/next] package/alsa-utils: bump to version 1.2.1
Message-ID: <1575035475-30413-1-git-send-email-pjtexier@koncepto.io>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
---
 package/alsa-utils/alsa-utils.hash | 2 +-
 package/alsa-utils/alsa-utils.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/alsa-utils/alsa-utils.hash b/package/alsa-utils/alsa-utils.hash
index d354e3c..2c55ce6 100644
--- a/package/alsa-utils/alsa-utils.hash
+++ b/package/alsa-utils/alsa-utils.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 5ddf2cbddb4bd1a4a2a6492a09c25898b08c3ad64893c3655be14194cf0a213a  alsa-utils-1.1.9.tar.bz2
+sha256 0b110ba71ef41d3009db1bc4dcae0cf79efb99cb5426fa19d0312470560a2c0d  alsa-utils-1.2.1.tar.bz2
 sha256 231f7edcc7352d7734a96eef0b8030f77982678c516876fcb81e25b32d68564c  COPYING
diff --git a/package/alsa-utils/alsa-utils.mk b/package/alsa-utils/alsa-utils.mk
index b5d0d75..47f07bf 100644
--- a/package/alsa-utils/alsa-utils.mk
+++ b/package/alsa-utils/alsa-utils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ALSA_UTILS_VERSION = 1.1.9
+ALSA_UTILS_VERSION = 1.2.1
 ALSA_UTILS_SOURCE = alsa-utils-$(ALSA_UTILS_VERSION).tar.bz2
 ALSA_UTILS_SITE = ftp://ftp.alsa-project.org/pub/utils
 ALSA_UTILS_LICENSE = GPL-2.0
-- 
2.7.4
