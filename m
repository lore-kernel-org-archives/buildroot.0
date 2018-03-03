From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat,  3 Mar 2018 15:36:52 +0100
Subject: [Buildroot] [PATCH 2/3] board/qemu/ppc64le-pseries: put Qemu
 command on one line
In-Reply-To: <20180303143653.16934-1-thomas.petazzoni@bootlin.com>
References: <20180303143653.16934-1-thomas.petazzoni@bootlin.com>
Message-ID: <20180303143653.16934-2-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This allows the toolchain building machinery used by
https://toolchains.bootlin.com to automatically re-use this Qemu
command line.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 board/qemu/ppc64le-pseries/readme.txt | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/board/qemu/ppc64le-pseries/readme.txt b/board/qemu/ppc64le-pseries/readme.txt
index beda5c0618..0fdb389828 100644
--- a/board/qemu/ppc64le-pseries/readme.txt
+++ b/board/qemu/ppc64le-pseries/readme.txt
@@ -1,8 +1,6 @@
 Run the emulation with:
 
-qemu-system-ppc64 -M pseries -nographic \
-		-kernel output/images/vmlinux \
-		-initrd output/images/rootfs.ext2
+qemu-system-ppc64 -M pseries -nographic -kernel output/images/vmlinux -initrd output/images/rootfs.ext2
 
 The login prompt will appear in the terminal window.
 
-- 
2.14.3
