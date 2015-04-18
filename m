From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 18 Apr 2015 19:08:28 +0200
Subject: [Buildroot] [git commit] board/riotboard: readme: Update description
Message-ID: <20150418170843.696B880E0E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0f9bee00c3491024ed2775ef12d2850ed6d3d407
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Thomas: rewrap text.]

Signed-off-by: Nikolay Dimitrov <picmaster@mail.bg>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 board/embest/riotboard/readme.txt |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/board/embest/riotboard/readme.txt b/board/embest/riotboard/readme.txt
index 8c31bbe..b7390d0 100644
--- a/board/embest/riotboard/readme.txt
+++ b/board/embest/riotboard/readme.txt
@@ -15,9 +15,9 @@ your SD-card:
 
 sudo dd if=output/images/u-boot.imx of=/dev/sdX bs=1k seek=1
 
-Create 1 partition on the SD-card using your favourite tool. The partition
-should be big enough to hold your rootfs, for example 128MiB. Here's how an
-example of such partition layout:
+Create 1 partition on the SD-card using your favourite tool. The
+partition should be big enough to hold your rootfs, for example
+128MiB. Here's an example partition layout:
 
    Device Boot      Start         End      Blocks   Id  System
 /dev/sdX1            2048      264191      131072   83  Linux
@@ -30,7 +30,7 @@ Deploy your rootfs to the SD-card:
 
 sudo mkdir /mnt/sdcard/
 sudo mount /dev/sdX1 /mnt/sdcard/
-sudo tar xf rootfs.tar -C /mnt/sdcard/
+sudo tar xf output/images/rootfs.tar -C /mnt/sdcard/
 sudo umount /dev/sdX1
 
 3. Running buildroot
