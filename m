From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Tue, 27 Apr 2021 11:49:20 +0200
Subject: [Buildroot] [PATCH] board/boundarydevices: update readme.txt for
 nitrogen8mp
Message-ID: <20210427094920.395378-1-gary.bisson@boundarydevices.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add mention about nitrogen8mp_defconfig which is meant for our
Nitrogen8MPlus SOM device.

Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
---
 board/boundarydevices/common/readme.txt | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/board/boundarydevices/common/readme.txt b/board/boundarydevices/common/readme.txt
index 307cfb5549..d3169b08f5 100644
--- a/board/boundarydevices/common/readme.txt
+++ b/board/boundarydevices/common/readme.txt
@@ -31,6 +31,9 @@ Here is the list of targeted platforms per defconfig:
   - Nitrogen8MNano
   - Nitrogen8MNano_SOM
 
+- nitrogen8mp_defconfig
+  - Nitrogen8MPlus_SOM
+
 To install, simply copy the image to your storage (SD, eMMC, USB):
 
 $ sudo dd if=output/images/sdcard.img of=/dev/sdX
-- 
2.30.2
