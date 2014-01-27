From: Spenser Gilliland <spenser@gillilanding.com>
Date: Mon, 27 Jan 2014 15:51:47 -0600
Subject: [Buildroot] [PATCH v2] gdb: change to tagged release
In-Reply-To: <1390859507-31670-1-git-send-email-spenser@gillilanding.com>
References: <1390859507-31670-1-git-send-email-spenser@gillilanding.com>
Message-ID: <1390859507-31670-11-git-send-email-spenser@gillilanding.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Spenser Gilliland <spenser@gillilanding.com>
---
 package/gdb/gdb.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/gdb/gdb.mk b/package/gdb/gdb.mk
index 2b2eb7a..4ef4831 100644
--- a/package/gdb/gdb.mk
+++ b/package/gdb/gdb.mk
@@ -34,7 +34,7 @@ endif
 ifeq ($(findstring git,$(GDB_VERSION))$(BR2_microblaze),gity)
 GDB_SITE = $(call github,Xilinx,gdb,$(GDB_VERSION))
 GDB_SOURCE = gdb-$(GDB_VERSION).tar.gz
-GDB_VERSION = 6be65fb56ea6694a9260733a536a023a1e2d4d57
+GDB_VERSION = xsdk_2013.4
 endif
 
 ifeq ($(GDB_VERSION),6.7.1-avr32-2.1.5)
-- 
1.8.3.2
