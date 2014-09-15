From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 15 Sep 2014 22:50:08 +0200
Subject: [Buildroot] [PATCH 6/8] gdb: reword prompt for host TUI option
In-Reply-To: <1410814210-10002-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1410814210-10002-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1410814210-10002-7-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

There is no need to name the option "GDB TUI support", since this
option is already visible "below" GDB in menuconfig/xconfig. Naming it
"TUI support" is therefore sufficient.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gdb/Config.in.host | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/gdb/Config.in.host b/package/gdb/Config.in.host
index fe3f90e..5d0e1b4 100644
--- a/package/gdb/Config.in.host
+++ b/package/gdb/Config.in.host
@@ -14,7 +14,7 @@ config BR2_PACKAGE_HOST_GDB
 if BR2_PACKAGE_HOST_GDB
 
 config BR2_PACKAGE_HOST_GDB_TUI
-	bool "GDB TUI support"
+	bool "TUI support"
 	help
 	  This option enables terminal user interface (TUI) for gdb
 
-- 
2.0.0
