From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 19 Jan 2021 21:22:59 +0100
Subject: [Buildroot] [git commit] package/zziplib: set ZZIPLIB_CPE_ID_VALID
Message-ID: <20210119200359.39AA282A54@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=902b3f53420801bcdbf4d925ea04e318c324b1d0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:zziplib_project:zziplib is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Azziplib_project%3Azziplib

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/zziplib/zziplib.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/zziplib/zziplib.mk b/package/zziplib/zziplib.mk
index 6c2efe7558..6cb9dedce8 100644
--- a/package/zziplib/zziplib.mk
+++ b/package/zziplib/zziplib.mk
@@ -8,6 +8,7 @@ ZZIPLIB_VERSION = 0.13.72
 ZZIPLIB_SITE = $(call github,gdraheim,zziplib,v$(ZZIPLIB_VERSION))
 ZZIPLIB_LICENSE = LGPL-2.0+ or MPL-1.1
 ZZIPLIB_LICENSE_FILES = docs/COPYING.LIB docs/COPYING.MPL docs/copying.htm
+ZZIPLIB_CPE_ID_VALID = YES
 ZZIPLIB_INSTALL_STAGING = YES
 ZZIPLIB_CONF_OPTS += \
 	-DZZIPDOCS=OFF \
