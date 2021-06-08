From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 8 Jun 2021 09:11:41 +0200
Subject: [Buildroot] [git commit branch/2021.02.x] package/netsurf: add
 NETSURF_CPE_ID_VENDOR
Message-ID: <20210608064257.521998A437@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d8805810c331db5a8d17f5eca01a1a0eaa3bf51f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

cpe:2.3:a:netsurf-browser:netsurf is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Anetsurf-browser%3Anetsurf

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 22c5e1f847ceb05071a2de1b32bd9ba5e74e439e)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
