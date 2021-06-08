From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 8 Jun 2021 10:26:06 +0200
Subject: [Buildroot] [git commit branch/2021.02.x] package/findutils: add
 FINDUTILS_CPE_ID_VENDOR
Message-ID: <20210608075705.11A507FE1E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8fd35db31bdedf7956c74a8ef2676cf344d5e3fd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

cpe:2.3:a:gnu:findutils is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Agnu%3Afindutils

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 5c81ffaffc9e14a9ec1009749c8b1c41f7bb9139)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/findutils/findutils.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/findutils/findutils.mk b/package/findutils/findutils.mk
index 13d8271e18..a16f827166 100644
--- a/package/findutils/findutils.mk
+++ b/package/findutils/findutils.mk
@@ -9,6 +9,7 @@ FINDUTILS_SOURCE = findutils-$(FINDUTILS_VERSION).tar.xz
 FINDUTILS_SITE = $(BR2_GNU_MIRROR)/findutils
 FINDUTILS_LICENSE = GPL-3.0+
 FINDUTILS_LICENSE_FILES = COPYING
+FINDUTILS_CPE_ID_VENDOR = gnu
 FINDUTILS_CONF_ENV = \
 	gl_cv_func_stdin=yes \
 	ac_cv_func_working_mktime=yes \
