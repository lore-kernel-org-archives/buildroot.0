From: Markos Chandras <markos.chandras@gmail.com>
Date: Thu, 6 Jun 2013 15:16:15 +0100
Subject: [Buildroot] [PATCH] xfsprogs: Version bump to 3.1.11
Message-ID: <1370528175-19851-1-git-send-email-markos.chandras@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Markos Chandras <markos.chandras@imgtec.com>

Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
---
 package/xfsprogs/xfsprogs.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/xfsprogs/xfsprogs.mk b/package/xfsprogs/xfsprogs.mk
index 532e8c0..823bf39 100644
--- a/package/xfsprogs/xfsprogs.mk
+++ b/package/xfsprogs/xfsprogs.mk
@@ -3,7 +3,7 @@
 # xfsprogs
 #
 #############################################################
-XFSPROGS_VERSION = 3.1.8
+XFSPROGS_VERSION = 3.1.11
 XFSPROGS_SITE=ftp://oss.sgi.com/projects/xfs/cmd_tars
 
 XFSPROGS_DEPENDENCIES = util-linux
-- 
1.8.2.1
