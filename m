From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 19 May 2021 21:51:06 +0200
Subject: [Buildroot] [git commit branch/2021.02.x] package/libmms: add
 LIBMMS_CPE_ID_VENDOR
Message-ID: <20210519192209.EFD1B88778@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e9126f22db37b0ab66202bf4596bb796573e4e3d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

cpe:2.3:a:libmms_project:libmms is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Alibmms_project%3Alibmms

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit c91b3c3ce2c54a1cec8d4d417f2b535c2595a719)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libmms/libmms.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libmms/libmms.mk b/package/libmms/libmms.mk
index 236fe1376e..a4c40ad60a 100644
--- a/package/libmms/libmms.mk
+++ b/package/libmms/libmms.mk
@@ -10,5 +10,6 @@ LIBMMS_INSTALL_STAGING = YES
 LIBMMS_DEPENDENCIES = host-pkgconf libglib2
 LIBMMS_LICENSE = LGPL-2.1+
 LIBMMS_LICENSE_FILES = COPYING.LIB
+LIBMMS_CPE_ID_VENDOR = libmms_project
 
 $(eval $(autotools-package))
