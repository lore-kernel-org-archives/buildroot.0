From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 19 May 2021 21:51:06 +0200
Subject: [Buildroot] [git commit branch/2021.02.x] package/enscript: add
 ENSCRIPT_CPE_ID_VENDOR
Message-ID: <20210519192209.9464B886E1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0146dd8ba072126273e5248e1c67acd7399b2412
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

cpe:2.3:a:gnu:enscript is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Agnu%3Aenscript

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 2ad812a0b3d2ade17100dc996040f3f5c43cacdf)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/enscript/enscript.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/enscript/enscript.mk b/package/enscript/enscript.mk
index fbc9e69dae..441ae3dad4 100644
--- a/package/enscript/enscript.mk
+++ b/package/enscript/enscript.mk
@@ -8,6 +8,7 @@ ENSCRIPT_VERSION = 1.6.6
 ENSCRIPT_SITE = $(BR2_GNU_MIRROR)/enscript
 ENSCRIPT_LICENSE = GPL-3.0+
 ENSCRIPT_LICENSE_FILES = COPYING
+ENSCRIPT_CPE_ID_VENDOR = gnu
 
 # Enable pthread threads if toolchain supports threads
 ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
