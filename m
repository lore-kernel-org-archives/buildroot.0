From: Markos Chandras <markos.chandras@gmail.com>
Date: Tue, 21 May 2013 15:15:08 +0100
Subject: [Buildroot] [PATCH] libsigsegv: Version bump to 2.10
Message-ID: <1369145708-25470-1-git-send-email-markos.chandras@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Markos Chandras <markos.chandras@imgtec.com>

Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
---
 package/libsigsegv/libsigsegv.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libsigsegv/libsigsegv.mk b/package/libsigsegv/libsigsegv.mk
index ac72c6d..b71e572 100644
--- a/package/libsigsegv/libsigsegv.mk
+++ b/package/libsigsegv/libsigsegv.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-LIBSIGSEGV_VERSION = 2.6
+LIBSIGSEGV_VERSION = 2.10
 LIBSIGSEGV_SITE = $(BR2_GNU_MIRROR)/libsigsegv
 LIBSIGSEGV_INSTALL_STAGING = YES
 LIBSIGSEGV_CONF_ENV = sv_cv_fault_posix=yes
-- 
1.8.2.1
