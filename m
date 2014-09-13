From: Frank Hunleth <fhunleth@troodon-software.com>
Date: Fri, 12 Sep 2014 20:12:22 -0400
Subject: [Buildroot] [PATCH] qwt: bump to version 6.1.0
Message-ID: <1410567142-5770-1-git-send-email-fhunleth@troodon-software.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Frank Hunleth <fhunleth@troodon-software.com>
---
 package/qwt/qwt.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/qwt/qwt.mk b/package/qwt/qwt.mk
index 776780b..3007bf7 100644
--- a/package/qwt/qwt.mk
+++ b/package/qwt/qwt.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-QWT_VERSION = 6.0.2
+QWT_VERSION = 6.1.0
 QWT_SOURCE = qwt-$(QWT_VERSION).tar.bz2
 QWT_SITE = http://downloads.sourceforge.net/project/qwt/qwt/$(QWT_VERSION)
 QWT_INSTALL_STAGING = YES
-- 
1.9.1
