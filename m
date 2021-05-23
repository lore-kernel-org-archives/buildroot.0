From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 23 May 2021 16:11:35 +0200
Subject: [Buildroot] [PATCH 1/1] package/netsurf: add NETSURF_CPE_ID_VENDOR
Message-ID: <20210523141135.1522549-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:netsurf-browser:netsurf is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Anetsurf-browser%3Anetsurf

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/netsurf/netsurf.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/netsurf/netsurf.mk b/package/netsurf/netsurf.mk
index 5677b6946c..1064698c12 100644
--- a/package/netsurf/netsurf.mk
+++ b/package/netsurf/netsurf.mk
@@ -9,6 +9,7 @@ NETSURF_SOURCE = netsurf-all-$(NETSURF_VERSION).tar.gz
 NETSURF_SITE = http://download.netsurf-browser.org/netsurf/releases/source-full
 NETSURF_LICENSE = GPL-2.0
 NETSURF_LICENSE_FILES = netsurf/COPYING
+NETSURF_CPE_ID_VENDOR = netsurf-browser
 # host-vim needed for the xxd utility
 NETSURF_DEPENDENCIES = expat jpeg libpng \
 	host-bison host-flex host-gperf host-pkgconf host-vim
-- 
2.30.2
