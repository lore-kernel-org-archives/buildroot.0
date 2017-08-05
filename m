From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat,  5 Aug 2017 11:26:29 +0200
Subject: [Buildroot] [PATCH/next 1/1] package/logrotate: bump version to
	3.12.3
Message-ID: <20170805092629.26196-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/logrotate/logrotate.hash | 2 +-
 package/logrotate/logrotate.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/logrotate/logrotate.hash b/package/logrotate/logrotate.hash
index 4985a17a8..860263c43 100644
--- a/package/logrotate/logrotate.hash
+++ b/package/logrotate/logrotate.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 62aa0229cfd34c7b6ea6a6736d569983bf4a3dd1f3c9e9c2efe2ffe2a0a55cf2 logrotate-3.11.0.tar.gz
+sha256 683ccb7fff74082471aa6bd9e962ae7a3f4d55eea7df41fd97aa12ec6f55e657  logrotate-3.12.3.tar.gz
diff --git a/package/logrotate/logrotate.mk b/package/logrotate/logrotate.mk
index b11fc883d..274b2b649 100644
--- a/package/logrotate/logrotate.mk
+++ b/package/logrotate/logrotate.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LOGROTATE_VERSION = 3.11.0
+LOGROTATE_VERSION = 3.12.3
 LOGROTATE_SITE = $(call github,logrotate,logrotate,$(LOGROTATE_VERSION))
 LOGROTATE_LICENSE = GPL-2.0+
 LOGROTATE_LICENSE_FILES = COPYING
-- 
2.11.0
