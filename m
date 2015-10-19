From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 19 Oct 2015 17:02:43 +0200
Subject: [Buildroot] [git commit] shared-mime-info: bump to version 1.5
Message-ID: <20151019150706.50ACC81D35@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=94f6f5b8df4f5bd8bc5358747cbc6a82c346bec9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/shared-mime-info/shared-mime-info.hash |    2 +-
 package/shared-mime-info/shared-mime-info.mk   |    4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/shared-mime-info/shared-mime-info.hash b/package/shared-mime-info/shared-mime-info.hash
index cd237dd..170c672 100644
--- a/package/shared-mime-info/shared-mime-info.hash
+++ b/package/shared-mime-info/shared-mime-info.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256	52c9f84a8c72de631a0458542980b1728560f59845eb5e93e1dbe825f4b72304	shared-mime-info-0.90.tar.bz2
+sha256	d6412840eb265bf36e61fd7b6fc6bea21b0f58cb22bed16f2ccccdd54bea4180	shared-mime-info-1.5.tar.xz
diff --git a/package/shared-mime-info/shared-mime-info.mk b/package/shared-mime-info/shared-mime-info.mk
index 80a9526..2892344 100644
--- a/package/shared-mime-info/shared-mime-info.mk
+++ b/package/shared-mime-info/shared-mime-info.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-SHARED_MIME_INFO_VERSION = 0.90
-SHARED_MIME_INFO_SOURCE = shared-mime-info-$(SHARED_MIME_INFO_VERSION).tar.bz2
+SHARED_MIME_INFO_VERSION = 1.5
+SHARED_MIME_INFO_SOURCE = shared-mime-info-$(SHARED_MIME_INFO_VERSION).tar.xz
 SHARED_MIME_INFO_SITE = http://freedesktop.org/~hadess
 SHARED_MIME_INFO_INSTALL_STAGING = YES
 SHARED_MIME_INFO_CONF_ENV = XMLLINT=$(HOST_DIR)/usr/bin/xmllint
