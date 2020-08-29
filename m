From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 29 Aug 2020 13:50:52 +0200
Subject: [Buildroot] [git commit branch/next] Config.in.legacy: adjust
 location of gdb 8.1 legacy option
Message-ID: <20200829114404.25D018219B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ed33cecb51dbc1aa6363e03bea99259b68a6f15f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

The gdb 8.1 option will have been removed from 2020.11, not 2020.08.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 Config.in.legacy | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index f002d18df6..4234ed5b35 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -144,7 +144,7 @@ endif
 
 ###############################################################################
 
-comment "Legacy options removed in 2020.08"
+comment "Legacy options removed in 2020.11"
 
 config BR2_GDB_VERSION_8_1
 	bool "gdb 8.1.x has been removed"
@@ -153,6 +153,8 @@ config BR2_GDB_VERSION_8_1
 	  The 8.1.x version of gdb has been removed. Use a newer
 	  version instead.
 
+comment "Legacy options removed in 2020.08"
+
 config BR2_PACKAGE_EFL_GIF
 	bool "efl evas gif loader is mandatory"
 	select BR2_LEGACY
