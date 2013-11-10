From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 10 Nov 2013 13:16:22 +0100
Subject: [Buildroot] [PATCH] configs: rename rpi_defconfig for consistency
Message-ID: <1384085782-32685-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: mathieu benoit <mathieu.benoit@savoirfairelinux.com>

We name all of our boards and defconfig files based on the boards
fullname, not a nickname or a shortname.

'rpi' is short for Raspberry Pi, so name all our Raspberry Pi ressource
with 'raspberrypi' instead of 'rpi'.

This should also help Buildroot-newcomers to recognise Raspberry Pi
related files (defconfig and board doc).

Signed-off-by: Mathieu Benoit <mathieu.benoit@savoirfairelinux.com>
[yann.morin.1998 at free.fr: reverse the rename]
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Ryan Barnett <rjbarnet@rockwellcollins.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 board/raspberrypi/readme.txt                     | 8 ++++----
 configs/{rpi_defconfig => raspberrypi_defconfig} | 0
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename configs/{rpi_defconfig => raspberrypi_defconfig} (100%)

diff --git a/board/raspberrypi/readme.txt b/board/raspberrypi/readme.txt
index 47b4818..2052e2b 100644
--- a/board/raspberrypi/readme.txt
+++ b/board/raspberrypi/readme.txt
@@ -17,11 +17,11 @@ How to build it
 Configure Buildroot
 -------------------
 
-The rpi_defconfig configuration is a minimal configuration with all that
-is required to bring the Raspberry Pi. You should base your work on this
-defconfig:
+The raspberrypi_defconfig configuration is a minimal configuration with
+all that is required to bring the Raspberry Pi. You should base your
+work on this defconfig:
 
-  $ make rpi_defconfig
+  $ make raspberrypi_defconfig
 
 If you want to use a persistent rootfs, skip to "Build the rootfs", below.
 
diff --git a/configs/rpi_defconfig b/configs/raspberrypi_defconfig
similarity index 100%
rename from configs/rpi_defconfig
rename to configs/raspberrypi_defconfig
-- 
1.8.1.2
