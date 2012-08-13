From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 13 Aug 2012 10:14:29 -0300
Subject: [Buildroot] [PATCH 1/2] wget: bump to version 1.14
Message-ID: <1344863670-7129-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/wget/wget.mk |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/package/wget/wget.mk b/package/wget/wget.mk
index a15111c..01ebcb6 100644
--- a/package/wget/wget.mk
+++ b/package/wget/wget.mk
@@ -4,8 +4,10 @@
 #
 #############################################################
 
-WGET_VERSION = 1.13.4
+WGET_VERSION = 1.14
 WGET_SITE = $(BR2_GNU_MIRROR)/wget
+WGET_LICENSE = GPLv3+
+WGET_LICENSE_FILES = COPYING
 
 # Prefer full-blown wget over busybox
 ifeq ($(BR2_PACKAGE_BUSYBOX),y)
-- 
1.7.8.6
