From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 14 Jan 2021 23:19:49 +0100
Subject: [Buildroot] [git commit] package/binutils: add
 BINUTILS_CPE_ID_VENDOR
Message-ID: <20210114220107.52D59877A5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=643fa9974583d960e890c98c6dc634c2993de819
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:gnu:binutils is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Agnu%3Abinutils

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/binutils/binutils.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/binutils/binutils.mk b/package/binutils/binutils.mk
index d978b424be..aff7f4ba86 100644
--- a/package/binutils/binutils.mk
+++ b/package/binutils/binutils.mk
@@ -35,6 +35,7 @@ BINUTILS_DEPENDENCIES = $(TARGET_NLS_DEPENDENCIES)
 BINUTILS_MAKE_OPTS = LIBS=$(TARGET_NLS_LIBS)
 BINUTILS_LICENSE = GPL-3.0+, libiberty LGPL-2.1+
 BINUTILS_LICENSE_FILES = COPYING3 COPYING.LIB
+BINUTILS_CPE_ID_VENDOR = gnu
 
 ifeq ($(BINUTILS_FROM_GIT),y)
 BINUTILS_DEPENDENCIES += host-flex host-bison
