From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 6 Jul 2017 21:46:04 +0200
Subject: [Buildroot] [git commit] pkg-stats: add exception for
	nvidia-tegra23.mk
Message-ID: <20170706195001.9D13881D55@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=67409d9303faa4df44bff56d46e16bb71855bf57
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This file is not a package per-se, it includes other .mk files that
are packages.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 support/scripts/pkg-stats | 1 +
 1 file changed, 1 insertion(+)

diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index eb48711..48a2cc2 100755
--- a/support/scripts/pkg-stats
+++ b/support/scripts/pkg-stats
@@ -126,6 +126,7 @@ for i in $(find boot/ linux/ package/ toolchain/ -name '*.mk' | sort) ; do
 	$i = "package/pkg-waf.mk" -o \
 	$i = "package/pkg-kernel-module.mk" -o \
 	$i = "package/pkg-utils.mk" -o \
+	$i = "package/nvidia-tegra23/nvidia-tegra23.mk" -o \
 	$i = "toolchain/toolchain-external/pkg-toolchain-external.mk" -o \
 	$i = "toolchain/toolchain-external/toolchain-external.mk" -o \
 	$i = "toolchain/toolchain.mk" -o \
