From: Carlos Santos <casantos@datacom.ind.br>
Date: Wed, 31 May 2017 22:00:10 -0300
Subject: [Buildroot] [PATCH] util-linux: wrap help text at column 72
Message-ID: <20170601010010.18346-1-casantos@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Respect the <tab><2 spaces><62 chars> rule.

Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
---
 package/util-linux/Config.in | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/util-linux/Config.in b/package/util-linux/Config.in
index e957f848b..86db3722c 100644
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
-- 
2.11.0
