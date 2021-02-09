From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 9 Feb 2021 10:54:33 +0100
Subject: [Buildroot] [git commit] package/bison: add BISON_CPE_ID_VENDOR
Message-ID: <20210209104539.269F381556@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=24401221d25f251802c36aa8d819f36556e5fa71
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:gnu:bison is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Agnu%3Abison

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/bison/bison.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/bison/bison.mk b/package/bison/bison.mk
index 70111a8d62..efd75afd66 100644
--- a/package/bison/bison.mk
+++ b/package/bison/bison.mk
@@ -9,6 +9,7 @@ BISON_SOURCE = bison-$(BISON_VERSION).tar.xz
 BISON_SITE = $(BR2_GNU_MIRROR)/bison
 BISON_LICENSE = GPL-3.0+
 BISON_LICENSE_FILES = COPYING
+BISON_CPE_ID_VENDOR = gnu
 # parallel build issue in examples/c/reccalc/
 BISON_MAKE = $(MAKE1)
 HOST_BISON_DEPENDENCIES = host-m4
