From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 19 Apr 2016 00:12:23 +0200
Subject: [Buildroot] [git commit] raspberrypi,
	raspberrypi2: document the two consoles (UART+HDMI)
Message-ID: <20160418221237.D3635818B3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=babf1190b3ef0dac15a99c862c814e916d32d819
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The defconfigs for the Raspberry Pi boards start a console on HDMI in
addition to the classic one on UART. Document this feature in the
readme.

Cc: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 board/raspberrypi/readme.txt | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/board/raspberrypi/readme.txt b/board/raspberrypi/readme.txt
index b21a75a..896be2d 100644
--- a/board/raspberrypi/readme.txt
+++ b/board/raspberrypi/readme.txt
@@ -74,4 +74,6 @@ Copy the bootable "sdcard.img" onto an SD card with "dd":
   $ sudo dd if=output/images/sdcard.img of=/dev/sdX
 
 Insert the SDcard into your Raspberry Pi, and power it up. Your new system
-should come up now.
+should come up now and start two consoles: one on the serial port on
+the P1 header, one on the HDMI output where you can login using a USB
+keyboard.
