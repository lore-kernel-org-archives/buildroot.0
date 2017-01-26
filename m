From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 26 Jan 2017 07:36:08 +0200
Subject: [Buildroot] [PATCH 4/4] board: raspberrypi: mention the Zero model
	in readme.txt
In-Reply-To: <50eb8d771ad78ed54338e29b393808d251366102.1485408968.git.baruch@tkos.co.il>
References: <50eb8d771ad78ed54338e29b393808d251366102.1485408968.git.baruch@tkos.co.il>
Message-ID: <a821842757835986b316f03025df6657034e83d7.1485408968.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 board/raspberrypi/readme.txt | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/board/raspberrypi/readme.txt b/board/raspberrypi/readme.txt
index b6adca5151f6..948269347bda 100644
--- a/board/raspberrypi/readme.txt
+++ b/board/raspberrypi/readme.txt
@@ -22,6 +22,10 @@ For models A, B, A+ or B+:
 
   $ make raspberrypi_defconfig
 
+For model Zero (model A+ in smaller form factor):
+
+  $ make raspberrypi0_defconfig
+
 For model 2 B:
 
   $ make raspberrypi2_defconfig
-- 
2.11.0
