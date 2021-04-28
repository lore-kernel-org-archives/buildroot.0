From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 28 Apr 2021 23:37:00 +0200
Subject: [Buildroot] [git commit] board/boundarydevices: update readme.txt
 for nitrogen8mp
Message-ID: <20210428211428.7F7E97FCBD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=affb91fe8e514e683d5090a58620785c429b32f8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add mention about nitrogen8mp_defconfig which is meant for our
Nitrogen8MPlus SOM device.

Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
