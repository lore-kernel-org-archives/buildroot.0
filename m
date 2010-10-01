From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 1 Oct 2010 16:41:05 +0200
Subject: [Buildroot] [git commit master 1/1] toolchain/gdb: fix WCHAR typo
Message-ID: <20101001144128.796548B819@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=11334624c1e30d3858e15724b57178fbb93136a0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 toolchain/gdb/Config.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/toolchain/gdb/Config.in b/toolchain/gdb/Config.in
index edd8715..b45de9a 100644
--- a/toolchain/gdb/Config.in
+++ b/toolchain/gdb/Config.in
@@ -8,7 +8,7 @@ config BR2_PACKAGE_GDB
 	    Build the full gdb debugger to run on the target.
 
 comment "Gdb debugger for the target needs WCHAR support in toolchain"
-	depends on !BR2_USE_WHCAR
+	depends on !BR2_USE_WCHAR
 
 config BR2_PACKAGE_GDB_SERVER
 	bool "Build gdb server for the Target"
-- 
1.7.1
