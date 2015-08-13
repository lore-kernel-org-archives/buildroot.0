From: =?UTF-8?q?Beno=C3=AEt=20Th=C3=A9baudeau?= <benoit@wsystem.com>
Date: Thu, 13 Aug 2015 18:22:51 +0200
Subject: [Buildroot] [PATCH 5/5] package/rpi-userland: bump version
In-Reply-To: <1439482971-92878-1-git-send-email-benoit@wsystem.com>
References: <1439482971-92878-1-git-send-email-benoit@wsystem.com>
Message-ID: <1439482971-92878-6-git-send-email-benoit@wsystem.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Changes since last version:
 - early frame sequential 3D support,
 - add exposure=off option,
 - khronos: merge with more recent header file,
 - vchiq: better error handling.

Signed-off-by: Beno?t Th?baudeau <benoit@wsystem.com>
---
 package/rpi-userland/rpi-userland.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/rpi-userland/rpi-userland.mk b/package/rpi-userland/rpi-userland.mk
index 403409d..f1914a2 100644
--- a/package/rpi-userland/rpi-userland.mk
+++ b/package/rpi-userland/rpi-userland.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RPI_USERLAND_VERSION = b834074d0c0d9d7e64c133ab14ed691999cee990
+RPI_USERLAND_VERSION = b864a841e5a459a66a890c22b3a34127cd226238
 RPI_USERLAND_SITE = $(call github,raspberrypi,userland,$(RPI_USERLAND_VERSION))
 RPI_USERLAND_LICENSE = BSD-3c
 RPI_USERLAND_LICENSE_FILES = LICENCE
-- 
2.1.4
