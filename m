From: Marek Belisko <marek.belisko@open-nandra.com>
Date: Mon, 30 Mar 2020 19:23:01 +0200
Subject: [Buildroot] [PATCH v2 4/4] nanopi_neo4_defconfig: Bump rootfs size
 to 70M
In-Reply-To: <1585588981-12498-1-git-send-email-marek.belisko@open-nandra.com>
References: <1585588981-12498-1-git-send-email-marek.belisko@open-nandra.com>
Message-ID: <1585588981-12498-5-git-send-email-marek.belisko@open-nandra.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When bumped kernel to 5.4 rootfs increase a bit and it doesn't fit to
default 60M. Increase size to 70M.

Signed-off-by: Marek Belisko <marek.belisko@open-nandra.com>
---
 configs/nanopi_neo4_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/nanopi_neo4_defconfig b/configs/nanopi_neo4_defconfig
index f68b5e2..8cc9bb4 100644
--- a/configs/nanopi_neo4_defconfig
+++ b/configs/nanopi_neo4_defconfig
@@ -46,6 +46,7 @@ BR2_TARGET_GENERIC_HOSTNAME="NanoPi Neo4"
 BR2_TARGET_GENERIC_ISSUE="Welcome to NanoPi Neo4!"
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_TARGET_ROOTFS_EXT2_SIZE="70M"
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
 BR2_PACKAGE_HOST_GENIMAGE=y
 BR2_PACKAGE_HOST_MTOOLS=y
-- 
2.7.4
