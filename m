From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 3 Feb 2021 23:16:09 +0100
Subject: [Buildroot] [git commit] configs/orangepi_r1_defconfig: fix typo in
 comment
Message-ID: <20210203215739.08F20816CA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6e4f081d0c60a5662d401fb87cdd9b66ec397466
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In commit 38d04e6b1341, I did a last-minute change by adding the comment
to explain where the PARTLABEL was coming from, and introduced a typo in
that comment.

Fix it.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 board/orangepi/orangepi-r1/genimage.cfg | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/board/orangepi/orangepi-r1/genimage.cfg b/board/orangepi/orangepi-r1/genimage.cfg
index 46097cd2e5..edda03b3ef 100644
--- a/board/orangepi/orangepi-r1/genimage.cfg
+++ b/board/orangepi/orangepi-r1/genimage.cfg
@@ -33,7 +33,7 @@ image sdcard.img {
 	}
 
 	# 'rootfs' will be used as the partition label, used
-	# with root=PARTLABEL=rootfs kernel commadn line
+	# with root=PARTLABEL=rootfs kernel command line
 	partition rootfs {
 		partition-type = 0x83
 		image = "rootfs.ext4"
