From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 2 May 2013 23:52:54 +0200
Subject: [Buildroot] [git commit] omap-u-boot-utils: define license
Message-ID: <20130502215429.939C599A15@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1bb2fe1a45f500a5cf1c66514344565f09400fa6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/omap-u-boot-utils/omap-u-boot-utils.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/omap-u-boot-utils/omap-u-boot-utils.mk b/package/omap-u-boot-utils/omap-u-boot-utils.mk
index bb894a5..8615fdb 100644
--- a/package/omap-u-boot-utils/omap-u-boot-utils.mk
+++ b/package/omap-u-boot-utils/omap-u-boot-utils.mk
@@ -6,6 +6,8 @@
 
 OMAP_U_BOOT_UTILS_VERSION = 8aff852
 OMAP_U_BOOT_UTILS_SITE = http://github.com/nmenon/omap-u-boot-utils/tarball/master
+OMAP_U_BOOT_UTILS_LICENSE = GPLv2, GPLv2+
+OMAP_U_BOOT_UTILS_LICENSE_FILES = COPYING
 
 define HOST_OMAP_U_BOOT_UTILS_BUILD_CMDS
 	$(MAKE) -C $(@D)
