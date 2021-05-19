From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 19 May 2021 21:51:06 +0200
Subject: [Buildroot] [git commit branch/2021.02.x] package/liboping: add
 LIBOPING_CPE_ID_VENDOR
Message-ID: <20210519192210.1008E88778@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=aef648849d68608133ac337639c01458f61371c4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

cpe:2.3:a:noping:liboping is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Anoping%3Aliboping

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit c3e5a675dd6b3aa30122a69b902cd7fedca7e6ce)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/liboping/liboping.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/liboping/liboping.mk b/package/liboping/liboping.mk
index 4aa3e30ee8..a4541cb3bf 100644
--- a/package/liboping/liboping.mk
+++ b/package/liboping/liboping.mk
@@ -11,6 +11,7 @@ LIBOPING_INSTALL_STAGING = YES
 LIBOPING_CONF_OPTS = --without-perl-bindings
 LIBOPING_LICENSE = LGPL-2.1+, GPL-2.0
 LIBOPING_LICENSE_FILES = COPYING
+LIBOPING_CPE_ID_VENDOR = noping
 
 ifeq ($(BR2_PACKAGE_NCURSES),y)
 LIBOPING_DEPENDENCIES += ncurses
