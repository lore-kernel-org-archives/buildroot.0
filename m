From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 20 May 2021 09:53:28 +0200
Subject: [Buildroot] [git commit branch/next] board/raspberrypi: add rpi4 64
 bit hint
Message-ID: <20210520073019.CEC308892D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=24c0306feb0ab0b860060025ba89cc39d05a1e03
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 board/raspberrypi/readme.txt | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/board/raspberrypi/readme.txt b/board/raspberrypi/readme.txt
index ac784e07fd..2a876f9ae4 100644
--- a/board/raspberrypi/readme.txt
+++ b/board/raspberrypi/readme.txt
@@ -43,6 +43,10 @@ For model 4 B:
 
   $ make raspberrypi4_defconfig
 
+or for model 4 B (64 bit):
+
+  $ make raspberrypi4_64_defconfig
+
 Build the rootfs
 ----------------
 
