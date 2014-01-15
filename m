From: spdawson at gmail.com <spdawson@gmail.com>
Date: Wed, 15 Jan 2014 09:19:22 +0000
Subject: [Buildroot] [PATCH] raspberrypi: tweak readme
Message-ID: <1389777562-4597-1-git-send-email-spdawson@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Simon Dawson <spdawson@gmail.com>

Make the readme.txt for the raspberrypi board less misleading regarding the
kernel image file name.

Signed-off-by: Simon Dawson <spdawson@gmail.com>
---
 board/raspberrypi/readme.txt | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/board/raspberrypi/readme.txt b/board/raspberrypi/readme.txt
index 2052e2b..8532de4 100644
--- a/board/raspberrypi/readme.txt
+++ b/board/raspberrypi/readme.txt
@@ -100,10 +100,9 @@ files:
 For example:
 
  $ cp output/images/rpi-firmware/* /mnt/mountpointboot
- $ cp output/images/zImage /mnt/mountpointboot/zImage.img
+ $ cp output/images/zImage /mnt/mountpointboot
 
-Note: The default name is kernel.img.
-Actually, the name is zImage and it's define in the file config.txt like:
+Note: The kernel image file name is defined in config.txt like this:
 kernel=zImage
 
 If you use a volatile rootfs, Skip to "Finish", below. For a persistent
-- 
1.8.3.2
