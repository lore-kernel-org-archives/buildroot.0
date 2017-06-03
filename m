From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat,  3 Jun 2017 19:50:53 +0200
Subject: [Buildroot] [PATCH 1/1] package/glog: bump version to v0.3.5
Message-ID: <20170603175053.15550-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/glog/glog.hash | 2 +-
 package/glog/glog.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/glog/glog.hash b/package/glog/glog.hash
index 4548ebac2..6f1efdb10 100644
--- a/package/glog/glog.hash
+++ b/package/glog/glog.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256	ce99d58dce74458f7656a68935d7a0c048fa7b4626566a71b7f4e545920ceb10	glog-v0.3.4.tar.gz
+sha256 7580e408a2c0b5a89ca214739978ce6ff480b5e7d8d7698a2aa92fadc484d1e0  glog-v0.3.5.tar.gz
diff --git a/package/glog/glog.mk b/package/glog/glog.mk
index 8a5c36b8f..3f17529f5 100644
--- a/package/glog/glog.mk
+++ b/package/glog/glog.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GLOG_VERSION = v0.3.4
+GLOG_VERSION = v0.3.5
 GLOG_SITE = $(call github,google,glog,$(GLOG_VERSION))
 GLOG_INSTALL_STAGING = YES
 GLOG_LICENSE = BSD-3-Clause
-- 
2.11.0
