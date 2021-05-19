From: Peter Seiderer <ps.report@gmx.net>
Date: Wed, 19 May 2021 23:51:13 +0200
Subject: [Buildroot] [PATCH/next v1 4/6] board/raspberrypi: add rpi4 64 bit
 hint
In-Reply-To: <20210519215115.21684-1-ps.report@gmx.net>
References: <20210519215115.21684-1-ps.report@gmx.net>
Message-ID: <20210519215115.21684-4-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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
 
-- 
2.31.1
