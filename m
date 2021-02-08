From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 8 Feb 2021 22:43:13 +0100
Subject: [Buildroot] [git commit] package/exfat(-utils): change license to
 GPL-2.0+
Message-ID: <20210209091332.948C683797@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=30a4dd20f329bb887e54a1b1720b78b55a4cce65
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The license is specified in https://github.com/relan/exfat/blob/master/COPYING and indicates GPL-2.0+
The license changed from from GPL-3.0+ to GPL-2.0+ in 2013 but was never updated in buildroot.

https://github.com/relan/exfat/commit/48573fff5d070863e3279769e8a95d5c15a5c77d

Signed-off-by: Pieter Ronsijn <pieterronsijn@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
 
