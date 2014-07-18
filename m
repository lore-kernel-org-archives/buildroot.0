From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 18 Jul 2014 09:59:16 -0300
Subject: [Buildroot] [PATCH] libnl: bump to version 3.2.25
Message-ID: <1405688356-26600-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/libnl/libnl.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libnl/libnl.mk b/package/libnl/libnl.mk
index c6d9b3e..ea0db2b 100644
--- a/package/libnl/libnl.mk
+++ b/package/libnl/libnl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNL_VERSION = 3.2.24
+LIBNL_VERSION = 3.2.25
 LIBNL_SITE = http://www.infradead.org/~tgr/libnl/files
 LIBNL_LICENSE = LGPLv2.1+
 LIBNL_LICENSE_FILES = COPYING
-- 
1.8.5.5
