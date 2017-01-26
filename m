From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 26 Jan 2017 22:43:34 +0100
Subject: [Buildroot] [git commit] board: raspberrypi: mention the Zero model
	in readme.txt
Message-ID: <20170126214426.54E417FA5F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b1039e793033e8b1005e212aed0571b263953a06
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 board/raspberrypi/readme.txt | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/board/raspberrypi/readme.txt b/board/raspberrypi/readme.txt
index b6adca5..9482693 100644
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
