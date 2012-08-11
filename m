From: Danomi Manchego <danomimanchego123@gmail.com>
Date: Sat, 11 Aug 2012 16:10:12 -0400
Subject: [Buildroot] [PATCH 02/17] busybox: add license info
In-Reply-To: <1344715827-9452-1-git-send-email-danomimanchego123@gmail.com>
References: <1344715827-9452-1-git-send-email-danomimanchego123@gmail.com>
Message-ID: <1344715827-9452-2-git-send-email-danomimanchego123@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
---
 package/busybox/busybox.mk |    3 +++
 1 file changed, 3 insertions(+)

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
-- 
1.7.9.5
