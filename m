From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 29 Mar 2020 16:29:45 +0200
Subject: [Buildroot] [git commit] board/boundarydevices: update readme.txt
Message-ID: <20200329141749.75A6088E47@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6ef7357942db2a6979ae88df509857b2f76a9343
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- update outdated website URL
- add missing Nitrogen8M configuration
- reword procedure to make it clear it works for all storages

Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 board/boundarydevices/common/readme.txt | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/board/boundarydevices/common/readme.txt b/board/boundarydevices/common/readme.txt
index 0625deef26..2c9a073d2f 100644
--- a/board/boundarydevices/common/readme.txt
+++ b/board/boundarydevices/common/readme.txt
@@ -1,6 +1,6 @@
 Buildroot for Boundary Devices platforms:
 
-https://boundarydevices.com/product-category/popular-sbc-and-som-modules/
+https://boundarydevices.com/nitrogen-sbcs-and-soms/
 
 Here is the list of targeted platforms per defconfig:
 
@@ -19,7 +19,11 @@ Here is the list of targeted platforms per defconfig:
 - nitrogen7_defconfig
   - Nitrogen7
 
-To install, simply copy the image to a uSD card:
+- nitrogen8m_defconfig
+  - Nitrogen8M
+  - Nitrogen8M_SOM
+
+To install, simply copy the image to your storage (SD, eMMC, USB):
 
 $ sudo dd if=output/images/sdcard.img of=/dev/sdX
 
