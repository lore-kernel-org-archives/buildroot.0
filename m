From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  2 Mar 2014 18:07:11 +0100
Subject: [Buildroot] [PATCH 1/3] package/rpi-userland: bump version
In-Reply-To: <cover.1393779995.git.yann.morin.1998@free.fr>
References: <cover.1393779995.git.yann.morin.1998@free.fr>
Message-ID: <e8335f14d23719ba6bfaf4cacd06acc5af3f472c.1393779995.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Fixes memory leaks due to improper thrads handling.
Fixes to example code.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/rpi-userland/rpi-userland.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/rpi-userland/rpi-userland.mk b/package/rpi-userland/rpi-userland.mk
index 223b645..69b6ee6 100644
--- a/package/rpi-userland/rpi-userland.mk
+++ b/package/rpi-userland/rpi-userland.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RPI_USERLAND_VERSION = 5cecd5ae71540a3c11270924251103b3b5c8513a
+RPI_USERLAND_VERSION = 68a2cba184d2726327026429abfe033acf217384
 RPI_USERLAND_SITE = $(call github,raspberrypi,userland,$(RPI_USERLAND_VERSION))
 RPI_USERLAND_LICENSE = BSD-3c
 RPI_USERLAND_LICENSE_FILES = LICENCE
-- 
1.8.3.2
