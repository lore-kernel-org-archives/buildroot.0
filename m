From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Thu, 16 Jan 2014 00:25:38 +0100
Subject: [Buildroot] [PATCH] libmodplug: bump to version 0.8.8.4
Message-ID: <1389828338-19143-1-git-send-email-maxime.hadjinlian@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
---
 package/libmodplug/libmodplug.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libmodplug/libmodplug.mk b/package/libmodplug/libmodplug.mk
index 2a74928..1d01252 100644
--- a/package/libmodplug/libmodplug.mk
+++ b/package/libmodplug/libmodplug.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBMODPLUG_VERSION = 0.8.7
+LIBMODPLUG_VERSION = 0.8.8.4
 LIBMODPLUG_SITE = http://downloads.sourceforge.net/project/modplug-xmms/libmodplug/$(LIBMODPLUG_VERSION)
 LIBMODPLUG_INSTALL_STAGING = YES
 LIBMODPLUG_LICENSE = Public Domain
-- 
1.8.5.2
