From: Cody P Schafer <cody@linux.vnet.ibm.com>
Date: Mon, 12 May 2014 21:03:12 -0700
Subject: [Buildroot] [PATCH v4 2/9] package/gdb: change default gdb from 7.5
	to 7.6
In-Reply-To: <1399953799-32054-1-git-send-email-cody@linux.vnet.ibm.com>
References: <1399953799-32054-1-git-send-email-cody@linux.vnet.ibm.com>
Message-ID: <1399953799-32054-3-git-send-email-cody@linux.vnet.ibm.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Cody P Schafer <cody@linux.vnet.ibm.com>
---
 package/gdb/Config.in.host | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/gdb/Config.in.host b/package/gdb/Config.in.host
index 9f6b880..16a7291 100644
--- a/package/gdb/Config.in.host
+++ b/package/gdb/Config.in.host
@@ -20,7 +20,7 @@ choice
 	default BR2_GDB_VERSION_6_6 if BR2_bfin
 	default BR2_GDB_VERSION_6_7_1_AVR32_2_1_5 if BR2_avr32
 	default BR2_GDB_VERSION_7_7 if BR2_powerpc64le
-	default BR2_GDB_VERSION_7_5
+	default BR2_GDB_VERSION_7_6
 	help
 	  Select the version of gdb you wish to use.
 
-- 
1.9.3
