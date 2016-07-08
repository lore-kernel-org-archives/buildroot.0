From: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Date: Fri,  8 Jul 2016 10:27:17 +0200
Subject: [Buildroot] [PATCH 1/1] package/Config.in: fix alphabetical order
Message-ID: <1467966437-20104-1-git-send-email-jerzy.grzegorek@trzebnica.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
---
 package/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/Config.in b/package/Config.in
index e7ea84f..8f68e17 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1643,13 +1643,13 @@ menu "System tools"
 	source "package/attr/Config.in"
 	source "package/audit/Config.in"
 	source "package/bootutils/Config.in"
+	source "package/cgroupfs-mount/Config.in"
 	source "package/circus/Config.in"
 	source "package/coreutils/Config.in"
 	source "package/cpuload/Config.in"
 	source "package/dcron/Config.in"
 	source "package/debianutils/Config.in"
 	source "package/docker-containerd/Config.in"
-	source "package/cgroupfs-mount/Config.in"
 	source "package/dsp-tools/Config.in"
 	source "package/efibootmgr/Config.in"
 	source "package/efivar/Config.in"
-- 
1.9.1
