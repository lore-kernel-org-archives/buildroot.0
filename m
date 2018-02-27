From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Mon, 26 Feb 2018 20:10:27 -0600
Subject: [Buildroot] [NEXT 12/26] gdb: add CPE id
In-Reply-To: <1519697441-54194-1-git-send-email-matthew.weber@rockwellcollins.com>
References: <1519697441-54194-1-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <1519697441-54194-13-git-send-email-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
---
 package/gdb/gdb.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/gdb/gdb.mk b/package/gdb/gdb.mk
index 5ca464a..966957f 100644
--- a/package/gdb/gdb.mk
+++ b/package/gdb/gdb.mk
@@ -16,6 +16,7 @@ endif
 
 GDB_LICENSE = GPL-2.0+, LGPL-2.0+, GPL-3.0+, LGPL-3.0+
 GDB_LICENSE_FILES = COPYING COPYING.LIB COPYING3 COPYING3.LIB
+GDB_CPE_ID = gnu:$(GDB_NAME):$(GDB_VERSION)
 
 # We only want gdbserver and not the entire debugger.
 ifeq ($(BR2_PACKAGE_GDB_DEBUGGER),)
-- 
1.9.1
