From: Baruch Siach <baruch@tkos.co.il>
Date: Tue,  7 Apr 2015 14:44:19 +0300
Subject: [Buildroot] [PATCH 1/2] board/raspberrypi: readme: add a missing
	word
Message-ID: <750c74e7558083272a595596adc199be64526a4b.1428407060.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 board/raspberrypi/readme.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/board/raspberrypi/readme.txt b/board/raspberrypi/readme.txt
index b513ca321347..7a6df0637ad8 100644
--- a/board/raspberrypi/readme.txt
+++ b/board/raspberrypi/readme.txt
@@ -23,7 +23,7 @@ Configure Buildroot
 -------------------
 
 The raspberrypi_defconfig configuration is a minimal configuration with
-all that is required to bring the Raspberry Pi. You should base your
+all that is required to bring the Raspberry Pi up. You should base your
 work on this defconfig:
 
   $ make raspberrypi_defconfig
-- 
2.1.4
