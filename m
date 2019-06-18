From: Pierre-Jean Texier <pjtexier@koncepto.io>
Date: Tue, 18 Jun 2019 21:08:41 +0200
Subject: [Buildroot] [PATCH 1/2] package/logrotate: bump to version 3.15.0
Message-ID: <1560884922-10439-1-git-send-email-pjtexier@koncepto.io>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

See https://github.com/logrotate/logrotate/releases/tag/3.15.0

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
---
 package/logrotate/logrotate.hash | 2 +-
 package/logrotate/logrotate.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/logrotate/logrotate.hash b/package/logrotate/logrotate.hash
index 70b068c..d83f69f 100644
--- a/package/logrotate/logrotate.hash
+++ b/package/logrotate/logrotate.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 fb1ff8502e7ae4aedaa3d0da8d3740a6a0f44b72e34666af724e9094b166c942  logrotate-3.13.0.tar.gz
+sha256 011b9e2c7dc785f702f960dc15b7871bd46e53a9a6e336299e4f3d22022986fd  logrotate-3.15.0.tar.gz
diff --git a/package/logrotate/logrotate.mk b/package/logrotate/logrotate.mk
index c2c4885..f0d2611 100644
--- a/package/logrotate/logrotate.mk
+++ b/package/logrotate/logrotate.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LOGROTATE_VERSION = 3.13.0
+LOGROTATE_VERSION = 3.15.0
 LOGROTATE_SITE = $(call github,logrotate,logrotate,$(LOGROTATE_VERSION))
 LOGROTATE_LICENSE = GPL-2.0+
 LOGROTATE_LICENSE_FILES = COPYING
-- 
2.7.4
