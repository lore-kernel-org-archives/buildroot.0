From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 5 Jul 2017 16:06:29 +0200
Subject: [Buildroot] [git commit] grub2: remove host/usr reference from help
	text
Message-ID: <20170705141336.0186781D3F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d3a59d8e66ac560ee4b7b1affb817bffb644cba3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 boot/grub2/Config.in | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/boot/grub2/Config.in b/boot/grub2/Config.in
index 7dc5cae..2f4a3f0 100644
--- a/boot/grub2/Config.in
+++ b/boot/grub2/Config.in
@@ -31,8 +31,8 @@ config BR2_TARGET_GRUB2
 	     sudo tar -C /mnt -xf output/images/rootfs.tar
 	     sudo umount /mnt
 	  5. Install Grub2
-	     sudo ./output/host/usr/sbin/grub-bios-setup \
-			-b ./output/host/usr/lib/grub/i386-pc/boot.img \
+	     sudo ./output/host/sbin/grub-bios-setup \
+			-b ./output/host/lib/grub/i386-pc/boot.img \
 			-c ./output/images/grub.img -d . /dev/loop0
 	  6. Cleanup loop device
 	     sudo partx -d /dev/loop0
