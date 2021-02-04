From: Pieter Ronsijn <pieterronsijn@gmail.com>
Date: Thu,  4 Feb 2021 22:57:22 +0100
Subject: [Buildroot] [PATCH 1/1] package/exfat(-utils): change license to
 GPL-2.0+
Message-ID: <20210204215722.60241-1-pieterronsijn@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The license is specified in https://github.com/relan/exfat/blob/master/COPYING and indicates GPL-2.0+
The license changed from from GPL-3.0+ to GPL-2.0+ in 2013 but was never updated in buildroot.

https://github.com/relan/exfat/commit/48573fff5d070863e3279769e8a95d5c15a5c77d

Signed-off-by: Pieter Ronsijn <pieterronsijn@gmail.com>
---
 package/exfat-utils/exfat-utils.mk | 2 +-
 package/exfat/exfat.mk             | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/exfat-utils/exfat-utils.mk b/package/exfat-utils/exfat-utils.mk
index 16d5aa03db..d13ec6bab8 100644
--- a/package/exfat-utils/exfat-utils.mk
+++ b/package/exfat-utils/exfat-utils.mk
@@ -6,7 +6,7 @@
 
 EXFAT_UTILS_VERSION = 1.3.0
 EXFAT_UTILS_SITE = https://github.com/relan/exfat/releases/download/v$(EXFAT_UTILS_VERSION)
-EXFAT_UTILS_LICENSE = GPL-3.0+
+EXFAT_UTILS_LICENSE = GPL-2.0+
 EXFAT_UTILS_LICENSE_FILES = COPYING
 
 EXFAT_UTILS_CONF_OPTS += --exec-prefix=/
diff --git a/package/exfat/exfat.mk b/package/exfat/exfat.mk
index d8744feb9b..e23495152e 100644
--- a/package/exfat/exfat.mk
+++ b/package/exfat/exfat.mk
@@ -8,7 +8,7 @@ EXFAT_VERSION = 1.3.0
 EXFAT_SITE = https://github.com/relan/exfat/releases/download/v$(EXFAT_VERSION)
 EXFAT_SOURCE = fuse-exfat-$(EXFAT_VERSION).tar.gz
 EXFAT_DEPENDENCIES = libfuse host-pkgconf
-EXFAT_LICENSE = GPL-3.0+
+EXFAT_LICENSE = GPL-2.0+
 EXFAT_LICENSE_FILES = COPYING
 EXFAT_CFLAGS = $(TARGET_CFLAGS) -std=c99
 
-- 
2.25.1
