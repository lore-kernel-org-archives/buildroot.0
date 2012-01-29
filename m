From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Sun, 29 Jan 2012 16:11:41 +0100
Subject: [Buildroot] [RFC 08/15] busybox: define license
In-Reply-To: <1327849908-15588-1-git-send-email-luca@lucaceresoli.net>
References: <1327849908-15588-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <1327849908-15588-9-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
---
 package/busybox/busybox.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index d18b6d0..b3c43d3 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -12,6 +12,7 @@ BUSYBOX_VERSION = $(call qstrip,$(BR2_BUSYBOX_VERSION))
 BUSYBOX_SITE = http://www.busybox.net/downloads
 endif
 BUSYBOX_SOURCE = busybox-$(BUSYBOX_VERSION).tar.bz2
+BUSYBOX_LICENSE = GPL_V2_ONLY
 BUSYBOX_BUILD_CONFIG = $(BUSYBOX_DIR)/.config
 # Allows the build system to tweak CFLAGS
 BUSYBOX_MAKE_ENV = $(TARGET_MAKE_ENV) CFLAGS="$(TARGET_CFLAGS) -I$(LINUX_HEADERS_DIR)/include"
-- 
1.7.5.4
