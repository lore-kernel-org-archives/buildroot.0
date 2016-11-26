From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 26 Nov 2016 15:00:19 +0100
Subject: [Buildroot] [git commit] qemu-ppc: fixup wrong startup example,
	use either -hda or -drive
Message-ID: <20161126140027.0E1068182C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1938ad4efa3a78275979467b521fb3545c5c6f9e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 board/qemu/ppc-g3beige/readme.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/board/qemu/ppc-g3beige/readme.txt b/board/qemu/ppc-g3beige/readme.txt
index 070fcbb..3bd88a6 100644
--- a/board/qemu/ppc-g3beige/readme.txt
+++ b/board/qemu/ppc-g3beige/readme.txt
@@ -1,6 +1,6 @@
 Run the emulation with:
 
-  qemu-system-ppc -M g3beige -kernel output/images/vmlinux -hda -drive file=output/images/rootfs.ext2,format=raw -append "console=ttyS0 root=/dev/hda" -serial stdio -net nic,model=rtl8139 -net user
+  qemu-system-ppc -M g3beige -kernel output/images/vmlinux -drive file=output/images/rootfs.ext2,format=raw -append "console=ttyS0 root=/dev/hda" -serial stdio -net nic,model=rtl8139 -net user
 
 The login prompt will appear in the terminal that started Qemu. The
 graphical window is the framebuffer.
