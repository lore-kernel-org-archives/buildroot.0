From: Stephan Hoffmann <sho@relinux.de>
Date: Fri,  6 Apr 2012 18:19:40 +0200
Subject: [Buildroot] [PATCH 2/2] qemu/x86_64: Adapted qemu command line in
	readme file
In-Reply-To: <1333729180-18218-1-git-send-email-sho@relinux.de>
References: <1333729180-18218-1-git-send-email-sho@relinux.de>
Message-ID: <1333729180-18218-2-git-send-email-sho@relinux.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Stephan Hoffmann <sho@reLinux.de>
---
 board/qemu/x86_64/readme.txt |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/board/qemu/x86_64/readme.txt b/board/qemu/x86_64/readme.txt
index c06d24f..70f28d8 100644
--- a/board/qemu/x86_64/readme.txt
+++ b/board/qemu/x86_64/readme.txt
@@ -1,5 +1,5 @@
 Run the emulation with:
 
-  qemu-system-x86_64 -M pc -kernel output/images/bzImage -drive file=output/images/rootfs.ext2,if=ide -append root=/dev/sda
+  qemu-system-x86_64 -M pc -kernel images/bzImage -drive file=images/rootfs.ext2,if=ide -append root=/dev/sda
 
 The login prompt will appear in the graphical window.
-- 
1.7.0.4
