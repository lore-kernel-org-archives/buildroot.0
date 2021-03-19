From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 19 Mar 2021 18:22:09 +0100
Subject: [Buildroot] [git commit branch/2021.02.x] package/hwloc: add
 SELinux refpolicy module
Message-ID: <20210319171640.133288829A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=76aa799cc48389c7b5f4790427e8fc7fca91e164
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

SELinux support for hwloc is added by the admin/hwloc refpolicy module.

Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 0604bba22ee0f1e444d6637e01c3da6307bd68dd)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
