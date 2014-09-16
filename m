From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 16 Sep 2014 22:32:49 +0200
Subject: [Buildroot] [git commit] gdb: reword prompt for host TUI option
Message-ID: <20140916210716.040039D6B9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ae054fcaa6e3887cf9e3b5b2441553e63bda0a0f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

There is no need to name the option "GDB TUI support", since this
option is already visible "below" GDB in menuconfig/xconfig. Naming it
"TUI support" is therefore sufficient.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gdb/Config.in.host |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

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
 
