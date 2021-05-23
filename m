From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 23 May 2021 20:27:37 +0200
Subject: [Buildroot] [git commit branch/2021.02.x] package/libfuse: add
 LIBFUSE_CPE_ID_VENDOR
Message-ID: <20210523180931.121E08A275@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=61d8bb3196fa2763997a787907be179fdc119100
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

cpe:2.3:a:libfuse_project:libfuse is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Alibfuse_project%3Alibfuse

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
[yann.morin.1998 at free.fr: fix URL]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 06a0b113304df2d276b7d3f2f2871b0943a56741)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libfuse/libfuse.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libfuse/libfuse.mk b/package/libfuse/libfuse.mk
index 074dc59886..2677e46853 100644
--- a/package/libfuse/libfuse.mk
+++ b/package/libfuse/libfuse.mk
@@ -9,6 +9,7 @@ LIBFUSE_SOURCE = fuse-$(LIBFUSE_VERSION).tar.gz
 LIBFUSE_SITE = https://github.com/libfuse/libfuse/releases/download/fuse-$(LIBFUSE_VERSION)
 LIBFUSE_LICENSE = GPL-2.0, LGPL-2.1
 LIBFUSE_LICENSE_FILES = COPYING COPYING.LIB
+LIBFUSE_CPE_ID_VENDOR = libfuse_project
 LIBFUSE_INSTALL_STAGING = YES
 LIBFUSE_DEPENDENCIES = $(if $(BR2_PACKAGE_LIBICONV),libiconv)
 LIBFUSE_CONF_OPTS = \
