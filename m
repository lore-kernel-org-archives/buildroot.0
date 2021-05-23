From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 23 May 2021 15:29:37 +0200
Subject: [Buildroot] [PATCH 1/2] package/libnids: add LIBNIDS_CPE_ID_VENDOR
Message-ID: <20210523132938.1520248-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:libnids_project:libnids is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Alibnids_project%3Alibnids

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libnids/libnids.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libnids/libnids.mk b/package/libnids/libnids.mk
index fb3df318b4..4a9138b80e 100644
--- a/package/libnids/libnids.mk
+++ b/package/libnids/libnids.mk
@@ -8,6 +8,7 @@ LIBNIDS_VERSION = 1.24
 LIBNIDS_SITE = https://sourceforge.net/projects/libnids/files/libnids/$(LIBNIDS_VERSION)
 LIBNIDS_LICENSE = GPL-2.0
 LIBNIDS_LICENSE_FILES = COPYING
+LIBNIDS_CPE_ID_VENDOR = libnids_project
 LIBNIDS_INSTALL_STAGING = YES
 LIBNIDS_DEPENDENCIES = host-pkgconf libpcap
 LIBNIDS_AUTORECONF = YES
-- 
2.30.2
