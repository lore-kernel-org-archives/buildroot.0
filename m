From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu,  6 Sep 2012 09:32:46 -0300
Subject: [Buildroot] [PATCH] libnl: bump to version 3.2.13
Message-ID: <1346934766-3190-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/libnl/libnl.mk |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/package/libnl/libnl.mk b/package/libnl/libnl.mk
index f757b1b..58f8d17 100644
--- a/package/libnl/libnl.mk
+++ b/package/libnl/libnl.mk
@@ -4,8 +4,10 @@
 #
 #############################################################
 
-LIBNL_VERSION = 3.2.11
+LIBNL_VERSION = 3.2.13
 LIBNL_SITE = http://www.infradead.org/~tgr/libnl/files
+LIBNL_LICENSE = LGPLv2.1+
+LIBNL_LICENSE_FILES = COPYING
 LIBNL_INSTALL_STAGING = YES
 LIBNL_DEPENDENCIES = host-bison
 LIBNL_MAKE = $(MAKE1)
-- 
1.7.8.6
