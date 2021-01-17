From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 17 Jan 2021 19:02:41 +0100
Subject: [Buildroot] [PATCH 1/1] package/ntfs-3g: add NTFS_3G_CPE_ID_VENDOR
Message-ID: <20210117180241.367089-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:tuxera:ntfs-3g is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Atuxera%3Antfs-3g

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
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
-- 
2.29.2
