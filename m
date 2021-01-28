From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 28 Jan 2021 17:43:11 +0100
Subject: [Buildroot] [git commit] package/x265: add X265_CPE_ID_VENDOR
Message-ID: <20210128162426.373578175F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=253c80291dd0e21fbf6842e9d739ec6f6fa3f807
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:multicorewareinc:x265 is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Amulticorewareinc%3Ax265

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/x265/x265.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/x265/x265.mk b/package/x265/x265.mk
index ae9e0acb64..872753eea8 100644
--- a/package/x265/x265.mk
+++ b/package/x265/x265.mk
@@ -9,6 +9,7 @@ X265_SOURCE = x265_$(X265_VERSION).tar.gz
 X265_SITE = https://bitbucket.org/multicoreware/x265/downloads
 X265_LICENSE = GPL-2.0+
 X265_LICENSE_FILES = COPYING
+X265_CPE_ID_VENDOR = multicorewareinc
 X265_SUBDIR = source
 X265_INSTALL_STAGING = YES
 X265_MAKE = $(MAKE1)
