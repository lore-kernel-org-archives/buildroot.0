From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 17 Jan 2021 16:37:12 +0100
Subject: [Buildroot] [PATCH 1/1] package/ecryptfs-utils: add
 ECRYPTFS_UTILS_CPE_ID_VENDOR
Message-ID: <20210117153712.348963-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:ecryptfs:ecryptfs-utils is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Aecryptfs%3Aecryptfs-utils

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/ecryptfs-utils/ecryptfs-utils.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/ecryptfs-utils/ecryptfs-utils.mk b/package/ecryptfs-utils/ecryptfs-utils.mk
index 3a3253a366..f087e81a42 100644
--- a/package/ecryptfs-utils/ecryptfs-utils.mk
+++ b/package/ecryptfs-utils/ecryptfs-utils.mk
@@ -9,6 +9,7 @@ ECRYPTFS_UTILS_SOURCE = ecryptfs-utils_$(ECRYPTFS_UTILS_VERSION).orig.tar.gz
 ECRYPTFS_UTILS_SITE = https://launchpad.net/ecryptfs/trunk/$(ECRYPTFS_UTILS_VERSION)/+download
 ECRYPTFS_UTILS_LICENSE = GPL-2.0+
 ECRYPTFS_UTILS_LICENSE_FILES = COPYING
+ECRYPTFS_UTILS_CPE_ID_VENDOR = ecryptfs
 
 ECRYPTFS_UTILS_DEPENDENCIES = keyutils libnss host-intltool
 ECRYPTFS_UTILS_CONF_OPTS = --disable-pywrap
-- 
2.29.2
