From: Axel Lin <axel.lin@ingics.com>
Date: Sat, 28 Dec 2013 10:22:28 +0800
Subject: [Buildroot] [PATCH] logrotate: bump to version 3.8.7
Message-ID: <1388197348.5625.1.camel@phoenix>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Axel Lin <axel.lin@ingics.com>
---
 package/logrotate/logrotate.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/logrotate/logrotate.mk b/package/logrotate/logrotate.mk
index 516fe8b..a41e074 100644
--- a/package/logrotate/logrotate.mk
+++ b/package/logrotate/logrotate.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LOGROTATE_VERSION = 3.8.6
+LOGROTATE_VERSION = 3.8.7
 LOGROTATE_SITE = https://www.fedorahosted.org/releases/l/o/logrotate/
 LOGROTATE_LICENSE = GPLv2+
 LOGROTATE_LICENSE_FILES = COPYING
-- 
1.8.1.2
