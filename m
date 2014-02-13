From: Anton Kolesov <anton.kolesov@synopsys.com>
Date: Thu, 13 Feb 2014 16:41:48 +0400
Subject: [Buildroot] [PATCH] gdb: arc: bump to git commit cb15acc
In-Reply-To: <1392295308-12937-1-git-send-email-anton.kolesov@synopsys.com>
References: <1392295308-12937-1-git-send-email-anton.kolesov@synopsys.com>
Message-ID: <1392295308-12937-5-git-send-email-anton.kolesov@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Anton Kolesov <anton.kolesov@synopsys.com>
---
 package/gdb/Config.in.host | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/gdb/Config.in.host b/package/gdb/Config.in.host
index 9c77028..420408a 100644
--- a/package/gdb/Config.in.host
+++ b/package/gdb/Config.in.host
@@ -53,5 +53,5 @@ config BR2_GDB_VERSION
                                    (!BR2_PACKAGE_HOST_GDB && BR2_avr32)
 	default "7.4.1"    if BR2_GDB_VERSION_7_4
 	default "7.5.1"    if BR2_GDB_VERSION_7_5 || !BR2_PACKAGE_HOST_GDB
-	default "f25a1952afd054205f9471e449c1f7ca5b271b7c" if BR2_arc
+	default "cb15acc5eecea46d041730e5c2c9fa1d4283ef25" if BR2_arc
 	default "6be65fb56ea6694a9260733a536a023a1e2d4d57" if BR2_microblaze
-- 
1.8.4.1
