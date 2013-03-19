From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 19 Mar 2013 14:55:22 -0300
Subject: [Buildroot] [PATCH] psmisc: bump to version 22.20
Message-ID: <1363715722-2271-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/psmisc/psmisc.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/psmisc/psmisc.mk b/package/psmisc/psmisc.mk
index 5d2333f..f251c17 100644
--- a/package/psmisc/psmisc.mk
+++ b/package/psmisc/psmisc.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-PSMISC_VERSION = 22.16
+PSMISC_VERSION = 22.20
 PSMISC_SITE = http://downloads.sourceforge.net/project/psmisc/psmisc
 PSMISC_LICENSE = GPLv2
 PSMISC_LICENSE_FILES = COPYING
-- 
1.8.1.5
