From: Chih-Min Chao <cmchao@gmail.com>
Date: Fri, 11 Mar 2011 16:13:27 +0800
Subject: [Buildroot] [PATCH 1/9] alsa-lib : bump to 1.0.24.1
Message-ID: <1299831215-26466-1-git-send-email-cmchao@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Chih-Min Chao <cmchao@gmail.com>
---
 package/multimedia/alsa-lib/alsa-lib.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/multimedia/alsa-lib/alsa-lib.mk b/package/multimedia/alsa-lib/alsa-lib.mk
index 2085a97..317e78f 100644
--- a/package/multimedia/alsa-lib/alsa-lib.mk
+++ b/package/multimedia/alsa-lib/alsa-lib.mk
@@ -3,7 +3,7 @@
 # alsa-lib
 #
 #############################################################
-ALSA_LIB_VERSION = 1.0.23
+ALSA_LIB_VERSION = 1.0.24.1
 ALSA_LIB_SOURCE = alsa-lib-$(ALSA_LIB_VERSION).tar.bz2
 ALSA_LIB_SITE = ftp://ftp.alsa-project.org/pub/lib
 ALSA_LIB_INSTALL_STAGING = YES
-- 
1.7.0.4
