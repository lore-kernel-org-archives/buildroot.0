From: Rhys Williams <github@wilberforce.co.nz>
Date: Sat, 21 Mar 2015 22:06:24 +1300
Subject: [Buildroot] [PATCH 1/2] Add lirc-tools
Message-ID: <1426928785-806-1-git-send-email-github@wilberforce.co.nz>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Rhys Williams <github@wilberforce.co.nz>
---
 package/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/Config.in b/package/Config.in
index 93fde92..f97ea6e 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -342,6 +342,7 @@ endif
 	source "package/iucode-tool/Config.in"
 	source "package/kbd/Config.in"
 	source "package/lcdproc/Config.in"
+	source "package/lirc-tools/Config.in"
 	source "package/lm-sensors/Config.in"
 	source "package/lshw/Config.in"
 	source "package/lsuio/Config.in"
-- 
2.3.2
