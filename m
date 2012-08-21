From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 21 Aug 2012 12:09:23 +0200
Subject: [Buildroot] [git commit] syslinux: add license information
Message-ID: <20120821110311.E533997206@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f13cb75fb7cbc5ac3ad69252bd10e1709aa4c450
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Simon Dawson <spdawson@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 boot/syslinux/syslinux.mk |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

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
 
