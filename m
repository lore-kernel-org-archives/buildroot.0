From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 16 Mar 2021 23:10:34 +0100
Subject: [Buildroot] [git commit] package/hwloc: add SELinux refpolicy module
Message-ID: <20210316214740.783B1881F2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0604bba22ee0f1e444d6637e01c3da6307bd68dd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

SELinux support for hwloc is added by the admin/hwloc refpolicy module.

Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/hwloc/hwloc.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/hwloc/hwloc.mk b/package/hwloc/hwloc.mk
index 81cb89e35b..9ec94f818d 100644
--- a/package/hwloc/hwloc.mk
+++ b/package/hwloc/hwloc.mk
@@ -12,6 +12,7 @@ HWLOC_LICENSE = BSD-3-Clause
 HWLOC_LICENSE_FILES = COPYING
 HWLOC_DEPENDENCIES = host-pkgconf
 HWLOC_INSTALL_STAGING = YES
+HWLOC_SELINUX_MODULES = hwloc
 
 HWLOC_CONF_OPTS = \
 	--disable-opencl \
