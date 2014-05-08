From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu,  8 May 2014 23:11:01 +0200
Subject: [Buildroot] [PATCH 2/3] package/rpi-userland: bump version
In-Reply-To: <cover.1399583377.git.yann.morin.1998@free.fr>
References: <cover.1399583377.git.yann.morin.1998@free.fr>
Message-ID: <d7cfbbdfd97d962ab00abc10a02d650cab79208e.1399583377.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Allow stereo modes to be selected for output; enable NTSC output.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/rpi-userland/rpi-userland.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/rpi-userland/rpi-userland.mk b/package/rpi-userland/rpi-userland.mk
index 7188dcf..f6e4443 100644
--- a/package/rpi-userland/rpi-userland.mk
+++ b/package/rpi-userland/rpi-userland.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RPI_USERLAND_VERSION = a59842a068cbd19e262701f30014499e9070fbf6
+RPI_USERLAND_VERSION = eccb81050afd177da1923404b366c6226f29bfe0
 RPI_USERLAND_SITE = $(call github,raspberrypi,userland,$(RPI_USERLAND_VERSION))
 RPI_USERLAND_LICENSE = BSD-3c
 RPI_USERLAND_LICENSE_FILES = LICENCE
-- 
1.8.3.2
