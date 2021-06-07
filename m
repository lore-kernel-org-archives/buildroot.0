From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 07 Jun 2021 15:17:46 -0000
Subject: [Buildroot] [git commit] board/raspberrypi: add rpi3 64 bit hint
Message-ID: <20210607144655.B328181191@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=eb3c965c8816519e3c07ad6f9fa6d17146b1cdab
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 board/raspberrypi/readme.txt | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/board/raspberrypi/readme.txt b/board/raspberrypi/readme.txt
index 8b3de6d251..ac784e07fd 100644
--- a/board/raspberrypi/readme.txt
+++ b/board/raspberrypi/readme.txt
@@ -35,6 +35,10 @@ For model 3 B and B+:
 
   $ make raspberrypi3_defconfig
 
+or for model 3 B and B+ (64 bit):
+
+  $ make raspberrypi3_64_defconfig
+
 For model 4 B:
 
   $ make raspberrypi4_defconfig
