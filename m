From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 17 Oct 2017 17:12:53 +0200
Subject: [Buildroot] [PATCH] logrotate: bump version to 3.13.0
Message-ID: <20171017151253.26746-1-brgl@bgdev.pl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
---
 package/logrotate/logrotate.hash | 2 +-
 package/logrotate/logrotate.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/logrotate/logrotate.hash b/package/logrotate/logrotate.hash
index 860263c436..70b068c67f 100644
--- a/package/logrotate/logrotate.hash
+++ b/package/logrotate/logrotate.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 683ccb7fff74082471aa6bd9e962ae7a3f4d55eea7df41fd97aa12ec6f55e657  logrotate-3.12.3.tar.gz
+sha256 fb1ff8502e7ae4aedaa3d0da8d3740a6a0f44b72e34666af724e9094b166c942  logrotate-3.13.0.tar.gz
diff --git a/package/logrotate/logrotate.mk b/package/logrotate/logrotate.mk
index 274b2b649d..c2c4885646 100644
--- a/package/logrotate/logrotate.mk
+++ b/package/logrotate/logrotate.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LOGROTATE_VERSION = 3.12.3
+LOGROTATE_VERSION = 3.13.0
 LOGROTATE_SITE = $(call github,logrotate,logrotate,$(LOGROTATE_VERSION))
 LOGROTATE_LICENSE = GPL-2.0+
 LOGROTATE_LICENSE_FILES = COPYING
-- 
2.13.2
