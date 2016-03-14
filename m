From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 14 Mar 2016 17:07:01 +0100
Subject: [Buildroot] [git commit] shared-mime-info: bump to version 1.6
Message-ID: <20160314160806.259C4816A3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=da9e4f2ad224b4a684ee2475e945750d1f1054fd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
