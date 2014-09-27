From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 27 Sep 2014 11:45:32 +0200
Subject: [Buildroot] [PATCH 2/3] package/rpi-userland: bump revision for
	fixes + enhancements
In-Reply-To: <cover.1411811051.git.yann.morin.1998@free.fr>
References: <cover.1411811051.git.yann.morin.1998@free.fr>
Message-ID: <8a050765d062c59912acd3403f241c4cd25fd93b.1411811051.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/rpi-userland/rpi-userland.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/rpi-userland/rpi-userland.mk b/package/rpi-userland/rpi-userland.mk
index 81ed95c..6c5fe89 100644
--- a/package/rpi-userland/rpi-userland.mk
+++ b/package/rpi-userland/rpi-userland.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RPI_USERLAND_VERSION = f9e6f9f3def8dc18dc0092cd695ccf53b8ba3efe
+RPI_USERLAND_VERSION = ffcc4bd7c4875b71376c4240116e251652c9bec0
 RPI_USERLAND_SITE = $(call github,raspberrypi,userland,$(RPI_USERLAND_VERSION))
 RPI_USERLAND_LICENSE = BSD-3c
 RPI_USERLAND_LICENSE_FILES = LICENCE
-- 
1.9.1
