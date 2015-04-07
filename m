From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 7 Apr 2015 21:27:30 +0200
Subject: [Buildroot] [git commit] board/raspberrypi: document RPi-2 defconfig
Message-ID: <20150407192740.42A907FCC9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c306225e5aac24f8a0f823fc8861f3b50f4c47ae
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Document the correct defconfig for ARMv7 based RPi-2.

Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 board/raspberrypi/readme.txt |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/board/raspberrypi/readme.txt b/board/raspberrypi/readme.txt
index 7a6df06..4ead046 100644
--- a/board/raspberrypi/readme.txt
+++ b/board/raspberrypi/readme.txt
@@ -32,6 +32,10 @@ Alternatively, if you want to test support for the Device Tree:
 
   $ make raspberrypi_dt_defconfig
 
+For Raspberry Pi 2 use a different defconfig:
+
+  $ make raspberrypi2_defconfig
+
 If you want to use a persistent rootfs, skip to "Build the rootfs", below.
 
 For a volatile rootfs, you have to slightly adjust the configuration:
