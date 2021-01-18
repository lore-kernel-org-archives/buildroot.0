From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 18 Jan 2021 21:49:07 +0100
Subject: [Buildroot] [git commit] package/ntfs-3g: add NTFS_3G_CPE_ID_VENDOR
Message-ID: <20210118203943.7E460818AD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cd0400ba9d2efd9127843f36a8849d3470f38036
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:tuxera:ntfs-3g is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Atuxera%3Antfs-3g

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/ntfs-3g/ntfs-3g.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/ntfs-3g/ntfs-3g.mk b/package/ntfs-3g/ntfs-3g.mk
index cbb356195c..1a388af761 100644
--- a/package/ntfs-3g/ntfs-3g.mk
+++ b/package/ntfs-3g/ntfs-3g.mk
@@ -12,6 +12,7 @@ NTFS_3G_INSTALL_STAGING = YES
 NTFS_3G_DEPENDENCIES = host-pkgconf
 NTFS_3G_LICENSE = GPL-2.0+, LGPL-2.0+
 NTFS_3G_LICENSE_FILES = COPYING COPYING.LIB
+NTFS_3G_CPE_ID_VENDOR = tuxera
 
 # 0001-Fixed-reporting-an-error-when-failed-to-build-the-mo.patch
 NTFS_3G_IGNORE_CVES += CVE-2019-9755
