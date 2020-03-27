From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Fri, 27 Mar 2020 18:12:02 +0100
Subject: [Buildroot] [PATCH v2 2/3] board/boundarydevices: update readme.txt
In-Reply-To: <20200327171203.619849-1-gary.bisson@boundarydevices.com>
References: <20200327171203.619849-1-gary.bisson@boundarydevices.com>
Message-ID: <20200327171203.619849-3-gary.bisson@boundarydevices.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- update outdated website URL
- add missing Nitrogen8M configuration
- reword procedure to make it clear it works for all storages

Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
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
 
-- 
2.25.1
