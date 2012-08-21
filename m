From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 21 Aug 2012 12:09:25 +0200
Subject: [Buildroot] [git commit] uboot: add license information
Message-ID: <20120821110311.F3F9597206@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=69d9ff2fb6f0f7de62446dd43022166aae38be82
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Simon Dawson <spdawson@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 boot/uboot/uboot.mk |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index 9e03d6a..f3810c2 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -6,6 +6,9 @@
 UBOOT_VERSION    = $(call qstrip,$(BR2_TARGET_UBOOT_VERSION))
 UBOOT_BOARD_NAME = $(call qstrip,$(BR2_TARGET_UBOOT_BOARDNAME))
 
+UBOOT_LICENSE = GPLv2+
+UBOOT_LICENSE_FILES = COPYING
+
 UBOOT_INSTALL_IMAGES = YES
 
 ifeq ($(UBOOT_VERSION),custom)
