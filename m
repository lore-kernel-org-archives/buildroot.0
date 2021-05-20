From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 20 May 2021 21:41:47 +0200
Subject: [Buildroot] [git commit] package/libfuse3: add CPE variables
Message-ID: <20210520191405.D00E3885B1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9e3e57394bd1268af5a79181080a8a9ad843b7f1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:libfuse_project:libfuse is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Alibfuse_project%3Alibfuse

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/libfuse3/libfuse3.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/libfuse3/libfuse3.mk b/package/libfuse3/libfuse3.mk
index d61e313391..b1624ba887 100644
--- a/package/libfuse3/libfuse3.mk
+++ b/package/libfuse3/libfuse3.mk
@@ -8,6 +8,8 @@ LIBFUSE3_VERSION = 3.10.3
 LIBFUSE3_SITE = $(call github,libfuse,libfuse,fuse-$(LIBFUSE3_VERSION))
 LIBFUSE3_LICENSE = LGPL-2.1
 LIBFUSE3_LICENSE_FILES = LICENSE
+LIBFUSE3_CPE_ID_VENDOR = libfuse_project
+LIBFUSE3_CPE_ID_PRODUCT = libfuse
 LIBFUSE3_INSTALL_STAGING = YES
 LIBFUSE3_DEPENDENCIES = $(if $(BR2_PACKAGE_LIBICONV),libiconv)
 LIBFUSE3_CONF_OPTS = \
