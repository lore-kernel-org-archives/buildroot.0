From: Erik Larsson <karl.erik.larsson@gmail.com>
Date: Mon, 21 May 2018 08:46:47 +0200
Subject: [Buildroot] [PATCH] package/imx-mkimage: update hash
Message-ID: <1526885207-22727-1-git-send-email-karl.erik.larsson@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Due to update in tar package (6e2f5d0254) this hash needs to be updated.

Fixes:

  http://autobuild.buildroot.net/results/7c63ab1188a45d4684e159456f561a4e7c39e612/

Signed-off-by: Erik Larsson <karl.erik.larsson@gmail.com>
---
 package/imx-mkimage/imx-mkimage.hash | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/imx-mkimage/imx-mkimage.hash b/package/imx-mkimage/imx-mkimage.hash
index 5ecb92d..e1cbdd9 100644
--- a/package/imx-mkimage/imx-mkimage.hash
+++ b/package/imx-mkimage/imx-mkimage.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 17e8285a346eb19d00780b13916dc281421c5b955707b9f2a662a6734142f1fb  imx-mkimage-rel_imx_4.9.51_8mq_ga.tar.gz
+sha256 bc79e11cfbde303e200287fa6624028c8ce5344f8a35ed179b3fe217d74155da  imx-mkimage-rel_imx_4.9.51_8mq_ga.tar.gz
 sha256 231f7edcc7352d7734a96eef0b8030f77982678c516876fcb81e25b32d68564c  iMX8dv/COPYING
-- 
2.7.4
