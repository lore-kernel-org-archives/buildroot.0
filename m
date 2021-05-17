From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 17 May 2021 23:19:44 +0200
Subject: [Buildroot] [git commit branch/2021.02.x]
 package/x11r7/xlib_libXtst: add CPE variables
Message-ID: <20210517210058.05836875F2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b9bd35609a836f16cc25ded2bb08a4ad9a110de7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

cpe:2.3:a:x:libxtst is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Ax%3Alibxtst

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 74e049a0f3cef8e43a4bc8422bb2f2ef289d5ed8)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/x11r7/xlib_libXtst/xlib_libXtst.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/x11r7/xlib_libXtst/xlib_libXtst.mk b/package/x11r7/xlib_libXtst/xlib_libXtst.mk
index e0d7e8217c..c79301e064 100644
--- a/package/x11r7/xlib_libXtst/xlib_libXtst.mk
+++ b/package/x11r7/xlib_libXtst/xlib_libXtst.mk
@@ -10,6 +10,8 @@ XLIB_LIBXTST_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBXTST_LICENSE = MIT
 XLIB_LIBXTST_LICENSE_FILES = COPYING
 XLIB_LIBXTST_INSTALL_STAGING = YES
+XLIB_LIBXTST_CPE_ID_VENDOR = x
+XLIB_LIBXTST_CPE_ID_PRODUCT = libxtst
 
 XLIB_LIBXTST_DEPENDENCIES = \
 	xlib_libX11 \
