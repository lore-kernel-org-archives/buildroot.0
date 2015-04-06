From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 6 Apr 2015 23:33:10 +0200
Subject: [Buildroot] [git commit] Makefile: add help for
	linux-update-defconfig target
Message-ID: <20150406213317.1B84A819A0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7916b97594f59efc2b86d99af9cdc1e0abdae4ca
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Makefile |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/Makefile b/Makefile
index bcb1f96..c691b57 100644
--- a/Makefile
+++ b/Makefile
@@ -888,6 +888,8 @@ endif
 ifeq ($(BR2_LINUX_KERNEL),y)
 	@echo '  linux-menuconfig       - Run Linux kernel menuconfig'
 	@echo '  linux-savedefconfig    - Run Linux kernel savedefconfig'
+	@echo '  linux-update-defconfig - Save the Linux configuration to the path specified'
+	@echo '                             by BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE'
 endif
 ifeq ($(BR2_TOOLCHAIN_BUILDROOT),y)
 	@echo '  uclibc-menuconfig      - Run uClibc menuconfig'
