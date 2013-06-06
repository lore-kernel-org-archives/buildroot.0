From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri,  7 Jun 2013 00:23:06 +0200
Subject: [Buildroot] [PATCH 2/2] package/rpi-userland: bump version
In-Reply-To: <cover.1370557253.git.yann.morin.1998@free.fr>
References: <cover.1370557253.git.yann.morin.1998@free.fr>
Message-ID: <c8dadc3da902bfffb5a43b17ac67c1eb3a82ee2c.1370557253.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/rpi-userland/rpi-userland.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/rpi-userland/rpi-userland.mk b/package/rpi-userland/rpi-userland.mk
index 45ad64b..55d7b09 100644
--- a/package/rpi-userland/rpi-userland.mk
+++ b/package/rpi-userland/rpi-userland.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RPI_USERLAND_VERSION = 5e9a740a88a889dfc8a18bb1b00c17e5dd9d0108
+RPI_USERLAND_VERSION = 986774edf7c91a8a91d59abadbdb0b34b5a387dc
 RPI_USERLAND_SITE = http://github.com/raspberrypi/userland/tarball/$(RPI_USERLAND_VERSION)
 RPI_USERLAND_LICENSE = BSD-3c
 RPI_USERLAND_LICENSE_FILES = LICENCE
-- 
1.8.1.2
