From: Stephan Hoffmann <sho@relinux.de>
Date: Fri,  6 Apr 2012 18:19:39 +0200
Subject: [Buildroot] [PATCH 1/2] qemu/x86: Adapted qemu command line in
	readme file
Message-ID: <1333729180-18218-1-git-send-email-sho@relinux.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Stephan Hoffmann <sho@reLinux.de>
---
 board/qemu/x86/readme.txt |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/board/qemu/x86/readme.txt b/board/qemu/x86/readme.txt
index 4ba6607..ae27428 100644
--- a/board/qemu/x86/readme.txt
+++ b/board/qemu/x86/readme.txt
@@ -1,5 +1,5 @@
 Run the emulation with:
 
-  qemu-system-i386 -M pc -kernel output/images/bzImage -drive file=output/images/rootfs.ext2,if=ide -append root=/dev/sda
+  qemu-system-i386 -M pc -kernel images/bzImage -drive file=images/rootfs.ext2,if=ide -append root=/dev/sda
 
 The login prompt will appear in the graphical window.
-- 
1.7.0.4
