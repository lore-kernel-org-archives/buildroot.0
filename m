From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 20 Apr 2021 23:23:13 +0200
Subject: [Buildroot] [git commit] package/parted: add _CPE_ID_VENDOR
Message-ID: <20210420205903.5A5A4812AF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cdfb226090e37ed41d03d4404009d16a73d1cad4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:parted_project:parted:* is a valid CPE identifier for this package:

 https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe:2.3:a:parted_project:parted

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/parted/parted.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/parted/parted.mk b/package/parted/parted.mk
index c3ab3ceb4b..66940fc516 100644
--- a/package/parted/parted.mk
+++ b/package/parted/parted.mk
@@ -11,6 +11,7 @@ PARTED_DEPENDENCIES = host-pkgconf util-linux
 PARTED_INSTALL_STAGING = YES
 PARTED_LICENSE = GPL-3.0+
 PARTED_LICENSE_FILES = COPYING
+PARTED_CPE_ID_VENDOR = parted_project
 
 ifeq ($(BR2_PACKAGE_READLINE),y)
 PARTED_DEPENDENCIES += readline
