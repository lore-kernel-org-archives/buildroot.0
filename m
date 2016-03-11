From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 11 Mar 2016 15:03:52 -0300
Subject: [Buildroot] [PATCH 1/2] shared-mime-info: bump to version 1.6
Message-ID: <1457719433-25900-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/shared-mime-info/shared-mime-info.hash | 2 +-
 package/shared-mime-info/shared-mime-info.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/shared-mime-info/shared-mime-info.hash b/package/shared-mime-info/shared-mime-info.hash
index 170c672..997751d 100644
--- a/package/shared-mime-info/shared-mime-info.hash
+++ b/package/shared-mime-info/shared-mime-info.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256	d6412840eb265bf36e61fd7b6fc6bea21b0f58cb22bed16f2ccccdd54bea4180	shared-mime-info-1.5.tar.xz
+sha256	b2f8f85b6467933824180d0252bbcaee523f550a8fbc95cc4391bd43c03bc34c	shared-mime-info-1.6.tar.xz
diff --git a/package/shared-mime-info/shared-mime-info.mk b/package/shared-mime-info/shared-mime-info.mk
index 2892344..aebc66b 100644
--- a/package/shared-mime-info/shared-mime-info.mk
+++ b/package/shared-mime-info/shared-mime-info.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SHARED_MIME_INFO_VERSION = 1.5
+SHARED_MIME_INFO_VERSION = 1.6
 SHARED_MIME_INFO_SOURCE = shared-mime-info-$(SHARED_MIME_INFO_VERSION).tar.xz
 SHARED_MIME_INFO_SITE = http://freedesktop.org/~hadess
 SHARED_MIME_INFO_INSTALL_STAGING = YES
-- 
2.4.10
