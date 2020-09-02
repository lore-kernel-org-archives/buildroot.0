From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 02 Sep 2020 16:24:34 -0000
Subject: [Buildroot] [git commit] package/gdb: switch to gdb 8.3 as the
 default
Message-ID: <20200902161634.DFD2785EB9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=259c9a488a72013fe22ff38ac0a93934825a2748
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Now that we have added support for gdb 9.2, let's switch to gdb 8.3 as
the default.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/gdb/Config.in.host | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/gdb/Config.in.host b/package/gdb/Config.in.host
index ab054b1596..8044a5bf83 100644
--- a/package/gdb/Config.in.host
+++ b/package/gdb/Config.in.host
@@ -63,7 +63,7 @@ config BR2_PACKAGE_HOST_GDB_SIM
 
 choice
 	prompt "GDB debugger Version"
-	default BR2_GDB_VERSION_8_2
+	default BR2_GDB_VERSION_8_3
 	depends on !BR2_arc
 	depends on !BR2_csky
 	help
