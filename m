From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 3 Mar 2018 17:19:25 +0100
Subject: [Buildroot] [git commit] board/qemu/ppc64le-pseries: put Qemu
 command on one line
Message-ID: <20180303162032.0A3F2815FF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1b554aa849c2ac9c9bdd805253e806b411df6e28
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This allows the toolchain building machinery used by
https://toolchains.bootlin.com to automatically re-use this Qemu
command line.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
 
