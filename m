From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 8 Jun 2017 23:16:46 +0200
Subject: [Buildroot] [git commit] util-linux: wrap help text at column 72
Message-ID: <20170608211650.C5C8D8189B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c59a2b69e2f11337b420f39df65a81bc5381826f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Respect the <tab><2 spaces><62 chars> rule.

Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/util-linux/Config.in | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/util-linux/Config.in b/package/util-linux/Config.in
index e957f84..86db372 100644
--- a/package/util-linux/Config.in
+++ b/package/util-linux/Config.in
@@ -99,7 +99,8 @@ config BR2_PACKAGE_UTIL_LINUX_CRAMFS
 	bool "cramfs utilities"
 	select BR2_PACKAGE_ZLIB
 	help
-	  Utilities for compressed ROM file system (fsck.cramfs, mkfs.cramfs)
+	  Utilities for compressed ROM file system (fsck.cramfs,
+	  mkfs.cramfs)
 
 config BR2_PACKAGE_UTIL_LINUX_EJECT
 	bool "eject"
