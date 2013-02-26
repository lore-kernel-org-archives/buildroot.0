From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 26 Feb 2013 19:01:59 +0100
Subject: [Buildroot] [PATCH] package/exfat{,-utils}: license is GPLv3+
Message-ID: <1361901719-7713-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/exfat-utils/exfat-utils.mk |    2 +-
 package/exfat/exfat.mk             |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/exfat-utils/exfat-utils.mk b/package/exfat-utils/exfat-utils.mk
index b1191e8..de66d55 100644
--- a/package/exfat-utils/exfat-utils.mk
+++ b/package/exfat-utils/exfat-utils.mk
@@ -7,7 +7,7 @@
 EXFAT_UTILS_VERSION = 1.0.1
 EXFAT_UTILS_SITE = http://exfat.googlecode.com/files
 EXFAT_UTILS_DEPENDENCIES = host-scons
-EXFAT_UTILS_LICENSE = GPLv3
+EXFAT_UTILS_LICENSE = GPLv3+
 EXFAT_UTILS_LICENSE_FILES = COPYING
 
 define EXFAT_UTILS_BUILD_CMDS
diff --git a/package/exfat/exfat.mk b/package/exfat/exfat.mk
index 673b6d2..bc794a0 100644
--- a/package/exfat/exfat.mk
+++ b/package/exfat/exfat.mk
@@ -8,7 +8,7 @@ EXFAT_VERSION = 1.0.1
 EXFAT_SITE = http://exfat.googlecode.com/files
 EXFAT_SOURCE = fuse-exfat-$(EXFAT_VERSION).tar.gz
 EXFAT_DEPENDENCIES = host-scons libfuse
-EXFAT_LICENSE = GPLv3
+EXFAT_LICENSE = GPLv3+
 EXFAT_LICENSE_FILES = COPYING
 
 define EXFAT_BUILD_CMDS
-- 
1.7.2.5
