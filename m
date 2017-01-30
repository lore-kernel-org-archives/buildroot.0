From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 30 Jan 2017 10:44:49 -0300
Subject: [Buildroot] [PATCH] shared-mime-info: bump to version 1.8
Message-ID: <20170130134449.3848-1-gustavo@zacarias.com.ar>
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
index 2007e0e..cf6c8f3 100644
--- a/package/shared-mime-info/shared-mime-info.hash
+++ b/package/shared-mime-info/shared-mime-info.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256	eacc781cfebaa2074e43cf9521dc7ab4391ace8a4712902b2841669c83144d2e	shared-mime-info-1.7.tar.xz
+sha256	2af55ef1a0319805b74ab40d331a3962c905477d76c086f49e34dc96363589e9	shared-mime-info-1.8.tar.xz
diff --git a/package/shared-mime-info/shared-mime-info.mk b/package/shared-mime-info/shared-mime-info.mk
index e917ab5..64bb4d5 100644
--- a/package/shared-mime-info/shared-mime-info.mk
+++ b/package/shared-mime-info/shared-mime-info.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SHARED_MIME_INFO_VERSION = 1.7
+SHARED_MIME_INFO_VERSION = 1.8
 SHARED_MIME_INFO_SOURCE = shared-mime-info-$(SHARED_MIME_INFO_VERSION).tar.xz
 SHARED_MIME_INFO_SITE = https://people.freedesktop.org/~hadess
 SHARED_MIME_INFO_INSTALL_STAGING = YES
-- 
2.10.2
