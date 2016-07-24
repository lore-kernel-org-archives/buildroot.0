From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 24 Jul 2016 23:25:31 +0200
Subject: [Buildroot] [git commit] support: pkg-stats: add efl package in
	packages stats
Message-ID: <20160724212537.A20197FAD5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bd3c4d8c7f69cb5e741786ba9970fffe57c9f6cc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since efl update to 1.15 version, the efl package is a "real"
Buildroot package. It doesn't contain any subdirectories anymore.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
