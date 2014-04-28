From: Anton Kolesov <Anton.Kolesov@synopsys.com>
Date: Mon, 28 Apr 2014 20:43:24 +0400
Subject: [Buildroot] [PATCH 2/4] gdb: arc: bump to git commit 816890e
In-Reply-To: <1398703406-12157-1-git-send-email-Anton.Kolesov@synopsys.com>
References: <1398703406-12157-1-git-send-email-Anton.Kolesov@synopsys.com>
Message-ID: <1398703406-12157-2-git-send-email-Anton.Kolesov@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This revision corresponds to the 4.8-R3 release of the ARC GNU Tool chain.

Signed-off-by: Anton Kolesov <Anton.Kolesov@synopsys.com>
Cc: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
---
 package/gdb/Config.in.host | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/gdb/Config.in.host b/package/gdb/Config.in.host
index cbcec18..cf01b94 100644
--- a/package/gdb/Config.in.host
+++ b/package/gdb/Config.in.host
@@ -51,7 +51,7 @@ config BR2_GDB_VERSION
 	                      (!BR2_PACKAGE_HOST_GDB && BR2_bfin)
 	default "6.7.1-avr32-2.1.5" if BR2_GDB_VERSION_6_7_1_AVR32_2_1_5 || \
                                    (!BR2_PACKAGE_HOST_GDB && BR2_avr32)
-	default "cb15acc5eecea46d041730e5c2c9fa1d4283ef25" if BR2_arc
+	default "816890e5d1685c957bf7ae03c304246619e77882" if BR2_arc
 	default "6be65fb56ea6694a9260733a536a023a1e2d4d57" if BR2_microblaze
 	default "7.4.1"    if BR2_GDB_VERSION_7_4
 	default "7.5.1"    if BR2_GDB_VERSION_7_5 || !BR2_PACKAGE_HOST_GDB
-- 
1.8.4.1
