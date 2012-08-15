From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 15 Aug 2012 12:02:48 +0200
Subject: [Buildroot] [git commit] busybox: add license info
Message-ID: <20120815100417.B03B2971BB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3a887b7eb85d32b651d2c028c75a06e41a0df8e9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/busybox/busybox.mk |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index 17ee50a..33f8633 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -12,6 +12,9 @@ BUSYBOX_VERSION = $(call qstrip,$(BR2_BUSYBOX_VERSION))
 BUSYBOX_SITE = http://www.busybox.net/downloads
 endif
 BUSYBOX_SOURCE = busybox-$(BUSYBOX_VERSION).tar.bz2
+BUSYBOX_LICENSE = GPLv2
+BUSYBOX_LICENSE_FILES = LICENSE
+
 BUSYBOX_BUILD_CONFIG = $(BUSYBOX_DIR)/.config
 # Allows the build system to tweak CFLAGS
 BUSYBOX_MAKE_ENV = $(TARGET_MAKE_ENV) CFLAGS="$(TARGET_CFLAGS) -I$(LINUX_HEADERS_DIR)/include"
