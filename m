From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Date: Thu, 28 Jan 2021 10:27:52 +0100
Subject: [Buildroot] [PATCH 4/9] package/hwloc: add SELinux refpolicy module
In-Reply-To: <20210128092757.1016598-1-maxime.chevallier@bootlin.com>
References: <20210128092757.1016598-1-maxime.chevallier@bootlin.com>
Message-ID: <20210128092757.1016598-5-maxime.chevallier@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

SELinux support for hwloc is added by the admin/hwloc refpolicy module.

Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
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
-- 
2.25.4
