From: Markos Chandras <markos.chandras@imgtec.com>
Date: Mon, 7 Oct 2013 13:49:56 +0100
Subject: [Buildroot] [PATCH] lighttpd: Version bump to 1.4.33
Message-ID: <1381150196-2946-1-git-send-email-markos.chandras@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
---
 package/lighttpd/lighttpd.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/lighttpd/lighttpd.mk b/package/lighttpd/lighttpd.mk
index f65ee6d..c820a73 100644
--- a/package/lighttpd/lighttpd.mk
+++ b/package/lighttpd/lighttpd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIGHTTPD_VERSION = 1.4.32
+LIGHTTPD_VERSION = 1.4.33
 LIGHTTPD_SOURCE = lighttpd-$(LIGHTTPD_VERSION).tar.xz
 LIGHTTPD_SITE = http://download.lighttpd.net/lighttpd/releases-1.4.x
 LIGHTTPD_LICENSE = BSD-3c
-- 
1.8.3.2
