From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat,  5 Oct 2013 00:00:08 +0200
Subject: [Buildroot] [PATCH 2/2] package/rpi-userland: bump version
In-Reply-To: <cover.1380923923.git.yann.morin.1998@free.fr>
References: <cover.1380923923.git.yann.morin.1998@free.fr>
Message-ID: <57f69b1a8e7a518cc9649b9f67f99894e62580f6.1380923923.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Misc enhancements and fixes for USB, camera, audio, codecs, dispman,
and openMAX.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/rpi-userland/rpi-userland.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/rpi-userland/rpi-userland.mk b/package/rpi-userland/rpi-userland.mk
index fca0e25..c3ea43a 100644
--- a/package/rpi-userland/rpi-userland.mk
+++ b/package/rpi-userland/rpi-userland.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RPI_USERLAND_VERSION = 8b271ac
+RPI_USERLAND_VERSION = 77d32cd
 RPI_USERLAND_SITE = http://github.com/raspberrypi/userland/tarball/$(RPI_USERLAND_VERSION)
 RPI_USERLAND_LICENSE = BSD-3c
 RPI_USERLAND_LICENSE_FILES = LICENCE
-- 
1.8.1.2
