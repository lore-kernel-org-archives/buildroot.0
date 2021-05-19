From: Peter Seiderer <ps.report@gmx.net>
Date: Wed, 19 May 2021 23:51:12 +0200
Subject: [Buildroot] [PATCH/next v1 3/6] board/raspberrypi: add rpi3 64 bit
 hint
In-Reply-To: <20210519215115.21684-1-ps.report@gmx.net>
References: <20210519215115.21684-1-ps.report@gmx.net>
Message-ID: <20210519215115.21684-3-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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
-- 
2.31.1
