From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Wed,  7 Mar 2012 21:58:18 +0100
Subject: [Buildroot] [RFC v2 18/31] busybox: define license
In-Reply-To: <1331153911-22277-1-git-send-email-luca@lucaceresoli.net>
References: <1331153911-22277-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <1331153911-22277-19-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
---
 package/busybox/busybox.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index 59448d5..f9e57a0 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -12,6 +12,8 @@ BUSYBOX_VERSION = $(call qstrip,$(BR2_BUSYBOX_VERSION))
 BUSYBOX_SITE = http://www.busybox.net/downloads
 endif
 BUSYBOX_SOURCE = busybox-$(BUSYBOX_VERSION).tar.bz2
+BUSYBOX_LICENSE = GPLv2-ONLY
+BUSYBOX_LICENSE_FILES = LICENSE
 BUSYBOX_BUILD_CONFIG = $(BUSYBOX_DIR)/.config
 # Allows the build system to tweak CFLAGS
 BUSYBOX_MAKE_ENV = $(TARGET_MAKE_ENV) CFLAGS="$(TARGET_CFLAGS) -I$(LINUX_HEADERS_DIR)/include"
-- 
1.7.5.4
