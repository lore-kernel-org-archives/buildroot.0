From: spdawson at gmail.com <spdawson@gmail.com>
Date: Sat, 18 Aug 2012 10:25:39 +0100
Subject: [Buildroot] [PATCH 3/5] syslinux: add license information
In-Reply-To: <1345281941-6722-1-git-send-email-spdawson@gmail.com>
References: <1345281941-6722-1-git-send-email-spdawson@gmail.com>
Message-ID: <1345281941-6722-3-git-send-email-spdawson@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Simon Dawson <spdawson@gmail.com>

Signed-off-by: Simon Dawson <spdawson@gmail.com>
---
 boot/syslinux/syslinux.mk |    3 +++
 1 file changed, 3 insertions(+)

diff --git a/boot/syslinux/syslinux.mk b/boot/syslinux/syslinux.mk
index 7df342f..f63f2e0 100644
--- a/boot/syslinux/syslinux.mk
+++ b/boot/syslinux/syslinux.mk
@@ -8,6 +8,9 @@ SYSLINUX_VERSION = 4.05
 SYSLINUX_SOURCE  = syslinux-$(SYSLINUX_VERSION).tar.bz2
 SYSLINUX_SITE    = $(BR2_KERNEL_MIRROR)/linux/utils/boot/syslinux/4.xx/
 
+SYSLINUX_LICENSE = GPLv2+
+SYSLINUX_LICENSE_FILES = COPYING
+
 SYSLINUX_INSTALL_TARGET = NO
 SYSLINUX_INSTALL_IMAGES = YES
 
-- 
1.7.9.5
