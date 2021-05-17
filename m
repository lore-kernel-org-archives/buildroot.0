From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 17 May 2021 23:24:08 +0200
Subject: [Buildroot] [git commit branch/2021.02.x] package/x11r7/libxcb: add
 LIBXCB_CPE_ID_VENDOR
Message-ID: <20210517210058.6905087C0E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4446b0353b1ecadb77a0e084126066c97de6f3ce
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

cpe:2.3:a:x:libxcb is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Ax%3Alibxcb

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 4a321afa836123c4887cff0c3309eb77caf30751)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/x11r7/libxcb/libxcb.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/x11r7/libxcb/libxcb.mk b/package/x11r7/libxcb/libxcb.mk
index 9a35a72995..4cbd9cf62f 100644
--- a/package/x11r7/libxcb/libxcb.mk
+++ b/package/x11r7/libxcb/libxcb.mk
@@ -9,6 +9,7 @@ LIBXCB_SOURCE = libxcb-$(LIBXCB_VERSION).tar.xz
 LIBXCB_SITE = http://xcb.freedesktop.org/dist
 LIBXCB_LICENSE = MIT
 LIBXCB_LICENSE_FILES = COPYING
+LIBXCB_CPE_ID_VENDOR = x
 
 LIBXCB_INSTALL_STAGING = YES
 
