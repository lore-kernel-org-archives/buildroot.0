From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 27 Oct 2019 20:16:05 +0100
Subject: [Buildroot] [git commit] board/stm32mp157c-dk2: fix typos in readme
 and extlinux file
Message-ID: <20191027190929.C65D38A4D2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a06cfa8b36e874d3757d0abd620bf778e7f5358c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bartosz Bilas <b.bilas@grinn-global.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../stm32mp157c-dk2/overlay/boot/extlinux/extlinux.conf             | 2 +-
 board/stmicroelectronics/stm32mp157c-dk2/readme.txt                 | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/board/stmicroelectronics/stm32mp157c-dk2/overlay/boot/extlinux/extlinux.conf b/board/stmicroelectronics/stm32mp157c-dk2/overlay/boot/extlinux/extlinux.conf
index 325f3fc30e..5b7f56ee77 100644
--- a/board/stmicroelectronics/stm32mp157c-dk2/overlay/boot/extlinux/extlinux.conf
+++ b/board/stmicroelectronics/stm32mp157c-dk2/overlay/boot/extlinux/extlinux.conf
@@ -1,4 +1,4 @@
-label stm32mp15-buildroot
+label stm32mp157c-dk2-buildroot
   kernel /boot/zImage
   devicetree /boot/stm32mp157c-dk2.dtb
   append root=/dev/mmcblk0p4 rootwait
diff --git a/board/stmicroelectronics/stm32mp157c-dk2/readme.txt b/board/stmicroelectronics/stm32mp157c-dk2/readme.txt
index ac2061a234..8edc3e8bbb 100644
--- a/board/stmicroelectronics/stm32mp157c-dk2/readme.txt
+++ b/board/stmicroelectronics/stm32mp157c-dk2/readme.txt
@@ -1,9 +1,9 @@
-STM32MP157 Discovery Kit
+STM32MP157C Discovery Kit v2
 
 Intro
 =====
 
-This configuration supports the STM32MP157 Discovery Kit 2 (DK2)
+This configuration supports the STM32MP157C Discovery Kit 2 (DK2)
 platform:
 
   https://www.st.com/en/evaluation-tools/stm32mp157c-dk2.html
@@ -11,7 +11,7 @@ platform:
 How to build
 ============
 
- $ make stm32mp157_dk_defconfig
+ $ make stm32mp157c_dk2_defconfig
  $ make
 
 How to write the microSD card
