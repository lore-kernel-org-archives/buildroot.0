From: Romain Naour <romain.naour@gmail.com>
Date: Sun, 24 Jul 2016 22:49:10 +0200
Subject: [Buildroot] [PATCH] support: pkg-stats: add efl package in packages
	stats
Message-ID: <1469393350-12548-1-git-send-email-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since efl update to 1.15 version, the efl package is a "real"
Buildroot package. It doesn't contain any subdirectories anymore.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 support/scripts/pkg-stats | 1 -
 1 file changed, 1 deletion(-)

diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index fad7ae9..cc3bef4 100755
--- a/support/scripts/pkg-stats
+++ b/support/scripts/pkg-stats
@@ -97,7 +97,6 @@ for i in $(find boot/ linux/ package/ -name '*.mk' | sort) ; do
 	$i = "linux/linux-ext-fbtft.mk" -o \
 	$i = "linux/linux-ext-xenomai.mk" -o \
 	$i = "linux/linux-ext-rtai.mk" -o \
-	$i = "package/efl/efl.mk" -o \
 	$i = "package/freescale-imx/freescale-imx.mk" -o \
 	$i = "package/gcc/gcc.mk" -o \
 	$i = "package/gstreamer/gstreamer.mk" -o \
-- 
2.5.5
