From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 25 Jan 2015 15:04:35 +0100
Subject: [Buildroot] [git commit] boards/raspberrypi: fix rootfs.tar path in
	readme
Message-ID: <20150125142313.59B4680142@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b8f45e7a090bedd292df868a1dd5ff9d16ffeb40
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The rootfs.tar file is located under ./output/images/.

Signed-off-by: Vivien Didelot <vivien.didelot@savoirfairelinux.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 board/raspberrypi/readme.txt |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

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
