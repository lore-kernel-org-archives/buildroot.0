From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 15 Jan 2015 15:06:49 -0300
Subject: [Buildroot] [PATCH] gdb: bump to version 7.8.2
Message-ID: <1421345209-25603-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/gdb/Config.in.host | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/gdb/Config.in.host b/package/gdb/Config.in.host
index e8402b7..7f9df3a 100644
--- a/package/gdb/Config.in.host
+++ b/package/gdb/Config.in.host
@@ -55,4 +55,4 @@ config BR2_GDB_VERSION
 	default "arc-2014.08-gdb" if BR2_arc
 	default "6be65fb56ea6694a9260733a536a023a1e2d4d57" if BR2_microblaze
 	default "7.7.1"    if BR2_GDB_VERSION_7_7 || !BR2_PACKAGE_HOST_GDB
-	default "7.8.1"	   if BR2_GDB_VERSION_7_8
+	default "7.8.2"	   if BR2_GDB_VERSION_7_8
-- 
2.0.5
