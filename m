From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Wed, 12 Apr 2017 11:39:07 +0200
Subject: [Buildroot] [PATCH 33/53] grub2: remove host/usr reference from
	help text
In-Reply-To: <20170412093928.1006-1-arnout@mind.be>
References: <20170412093928.1006-1-arnout@mind.be>
Message-ID: <20170412093928.1006-34-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 boot/grub2/Config.in | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/boot/grub2/Config.in b/boot/grub2/Config.in
index 7dc5cae218..2f4a3f069e 100644
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
-- 
2.11.0
