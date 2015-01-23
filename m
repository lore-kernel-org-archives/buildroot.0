From: Vivien Didelot <vivien.didelot@savoirfairelinux.com>
Date: Fri, 23 Jan 2015 16:05:08 -0500
Subject: [Buildroot] [PATCH] boards/raspberrypi: fix rootfs.tar path in
	readme
Message-ID: <1422047108-5486-1-git-send-email-vivien.didelot@savoirfairelinux.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The rootfs.tar file is located under ./output/images/.

Signed-off-by: Vivien Didelot <vivien.didelot@savoirfairelinux.com>
---
 board/raspberrypi/readme.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/board/raspberrypi/readme.txt b/board/raspberrypi/readme.txt
index 725ad9d..ead9227 100644
--- a/board/raspberrypi/readme.txt
+++ b/board/raspberrypi/readme.txt
@@ -132,7 +132,7 @@ rootfs, there are further steps to do.
 Extract (as root!) the contents of the rootfs.tar archive into the second
 partition you created above:
 
-  $ sudo tar xf rootfs.tar -C /mnt/mountpointroot
+  $ sudo tar xf ./output/images/rootfs.tar -C /mnt/mountpointroot
 
 Finish
 ======
-- 
2.2.2
