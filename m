From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 14 Dec 2015 10:10:51 -0300
Subject: [Buildroot] [PATCH 12/45] gdb: comma separate licenses
In-Reply-To: <1450098684-17399-1-git-send-email-gustavo@zacarias.com.ar>
References: <1450098684-17399-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1450098684-17399-13-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/gdb/gdb.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/gdb/gdb.mk b/package/gdb/gdb.mk
index 15f394c..3b0f501 100644
--- a/package/gdb/gdb.mk
+++ b/package/gdb/gdb.mk
@@ -23,7 +23,7 @@ ifneq ($(filter 7.7.%,$(GDB_VERSION)),)
 GDB_SOURCE = gdb-$(GDB_VERSION).tar.bz2
 endif
 
-GDB_LICENSE = GPLv2+ LGPLv2+ GPLv3+ LGPLv3+
+GDB_LICENSE = GPLv2+, LGPLv2+, GPLv3+, LGPLv3+
 GDB_LICENSE_FILES = COPYING COPYING.LIB COPYING3 COPYING3.LIB
 
 # We only want gdbserver and not the entire debugger.
-- 
2.4.10
