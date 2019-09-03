From: Pierre-Jean Texier <pjtexier@koncepto.io>
Date: Tue,  3 Sep 2019 22:32:48 +0200
Subject: [Buildroot] [PATCH 1/1] package/logrotate: bump to version 3.15.1
Message-ID: <1567542768-20723-1-git-send-email-pjtexier@koncepto.io>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

See https://github.com/logrotate/logrotate/releases/tag/3.15.1

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
---
 package/logrotate/logrotate.hash | 2 +-
 package/logrotate/logrotate.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/logrotate/logrotate.hash b/package/logrotate/logrotate.hash
index b147405..6da1479 100644
--- a/package/logrotate/logrotate.hash
+++ b/package/logrotate/logrotate.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 011b9e2c7dc785f702f960dc15b7871bd46e53a9a6e336299e4f3d22022986fd  logrotate-3.15.0.tar.gz
+sha256 a7b20f5184c9598c36546f9200d3bd616d561478a0423ab8074e97a1cd7b1c25  logrotate-3.15.1.tar.gz
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/logrotate/logrotate.mk b/package/logrotate/logrotate.mk
index f0d2611..831e239 100644
--- a/package/logrotate/logrotate.mk
+++ b/package/logrotate/logrotate.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LOGROTATE_VERSION = 3.15.0
+LOGROTATE_VERSION = 3.15.1
 LOGROTATE_SITE = $(call github,logrotate,logrotate,$(LOGROTATE_VERSION))
 LOGROTATE_LICENSE = GPL-2.0+
 LOGROTATE_LICENSE_FILES = COPYING
-- 
2.7.4
