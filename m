From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 2 Mar 2021 21:37:49 +0100
Subject: [Buildroot] [git commit] package/giflib: set GIFLIB_CPE_ID_VALID
Message-ID: <20210302201930.197E58142A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2ed095025c1a9602bb634ca02f8ef3036c37f1ee
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:giflib_project:giflib is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Agiflib_project%3Agiflib

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/giflib/giflib.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/giflib/giflib.mk b/package/giflib/giflib.mk
index 3dd17972e0..9b4f602db6 100644
--- a/package/giflib/giflib.mk
+++ b/package/giflib/giflib.mk
@@ -9,6 +9,7 @@ GIFLIB_SITE = http://downloads.sourceforge.net/project/giflib
 GIFLIB_INSTALL_STAGING = YES
 GIFLIB_LICENSE = MIT
 GIFLIB_LICENSE_FILES = COPYING
+GIFLIB_CPE_ID_VALID = YES
 
 ifeq ($(BR2_STATIC_LIBS),y)
 GIFLIB_BUILD_LIBS = static-lib
