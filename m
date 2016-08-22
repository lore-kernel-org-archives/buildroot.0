From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 22 Aug 2016 16:32:09 +0200
Subject: [Buildroot] [git commit] board/pc/readme.txt: fix output image name
Message-ID: <20160822143222.2B66B8212E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4249837f422c8d560d38693c132dd7be58cbb900
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The instructions listed sdcard.img as output image name but
board/pc/genimage-*.cfg generate it named as disk.img instead.

Signed-off-by: Erico Nunes <nunes.erico@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 board/pc/readme.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/board/pc/readme.txt b/board/pc/readme.txt
index 33b479d..68ca211 100644
--- a/board/pc/readme.txt
+++ b/board/pc/readme.txt
@@ -24,7 +24,7 @@ Bare PC sample config
 
   Write the image to a pendrive:
 
-  $ dd if=output/images/sdcard.img of=/dev/sdc; sync
+  $ dd if=output/images/disk.img of=/dev/sdc; sync
 
   Once it's done insert it into the target PC and boot.
 
