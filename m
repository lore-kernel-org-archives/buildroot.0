From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date: Mon,  4 Jan 2016 15:14:18 -0300
Subject: [Buildroot] [PATCH] strace: enable supported nios2 arch
Message-ID: <1451931258-30051-1-git-send-email-ezequiel@vanguardiasur.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Support for Nios-II has been added in strace release 4.11.

Signed-off-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
---
 package/strace/Config.in | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/strace/Config.in b/package/strace/Config.in
index bdd76382c8c4..bbb582ad5306 100644
--- a/package/strace/Config.in
+++ b/package/strace/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_STRACE
 	bool "strace"
-	depends on !BR2_nios2
 	help
 	  A useful diagnostic, instructional, and debugging tool.
 	  Allows you to track what system calls a program makes
-- 
2.6.4
