From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 17 Jul 2019 08:56:35 +0200
Subject: [Buildroot] [git commit] fs/cpio: fix typo in comment
Message-ID: <20190717065456.A93D281641@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c4d09c8b186f12ac88bad620a48dde6ce6de3c9b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

--reproducible is --reproducible, not --repoducible.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 fs/cpio/cpio.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/cpio/cpio.mk b/fs/cpio/cpio.mk
index 8b133f3875..28a435dd5e 100644
--- a/fs/cpio/cpio.mk
+++ b/fs/cpio/cpio.mk
@@ -29,7 +29,7 @@ endif # BR2_ROOTFS_DEVICE_CREATION_STATIC
 
 ROOTFS_CPIO_PRE_GEN_HOOKS += ROOTFS_CPIO_ADD_INIT
 
-# --repoducible option was introduced in cpio v2.12, which may not be
+# --reproducible option was introduced in cpio v2.12, which may not be
 # available in some old distributions, so we build host-cpio
 ifeq ($(BR2_REPRODUCIBLE),y)
 ROOTFS_CPIO_DEPENDENCIES += host-cpio
