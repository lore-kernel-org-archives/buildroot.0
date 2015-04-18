From: Nikolay Dimitrov <picmaster@mail.bg>
Date: Sat, 18 Apr 2015 17:13:31 +0300
Subject: [Buildroot] [PATCH 2/2] board/riotboard: readme: Update description
In-Reply-To: <1429366411-8463-1-git-send-email-picmaster@mail.bg>
References: <1429366411-8463-1-git-send-email-picmaster@mail.bg>
Message-ID: <1429366411-8463-2-git-send-email-picmaster@mail.bg>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Nikolay Dimitrov <picmaster@mail.bg>
---
 board/embest/riotboard/readme.txt |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/board/embest/riotboard/readme.txt b/board/embest/riotboard/readme.txt
index 8c31bbe..c734ec4 100644
--- a/board/embest/riotboard/readme.txt
+++ b/board/embest/riotboard/readme.txt
@@ -16,8 +16,8 @@ your SD-card:
 sudo dd if=output/images/u-boot.imx of=/dev/sdX bs=1k seek=1
 
 Create 1 partition on the SD-card using your favourite tool. The partition
-should be big enough to hold your rootfs, for example 128MiB. Here's how an
-example of such partition layout:
+should be big enough to hold your rootfs, for example 128MiB. Here's an example
+partition layout:
 
    Device Boot      Start         End      Blocks   Id  System
 /dev/sdX1            2048      264191      131072   83  Linux
@@ -30,7 +30,7 @@ Deploy your rootfs to the SD-card:
 
 sudo mkdir /mnt/sdcard/
 sudo mount /dev/sdX1 /mnt/sdcard/
-sudo tar xf rootfs.tar -C /mnt/sdcard/
+sudo tar xf output/images/rootfs.tar -C /mnt/sdcard/
 sudo umount /dev/sdX1
 
 3. Running buildroot
-- 
1.7.10.4
