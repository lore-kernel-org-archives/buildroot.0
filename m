From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 15 May 2021 11:54:25 +0200
Subject: [Buildroot] [PATCH 1/1] package/gstreamer1/gstreamer1: add CPE
 variables
Message-ID: <20210515095425.2364999-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:gstreamer_project:gstreamer is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Agstreamer_project%3Agstreamer

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/gstreamer1/gstreamer1/gstreamer1.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/gstreamer1/gstreamer1/gstreamer1.mk b/package/gstreamer1/gstreamer1/gstreamer1.mk
index 99846c1be5..171ea2b8e3 100644
--- a/package/gstreamer1/gstreamer1/gstreamer1.mk
+++ b/package/gstreamer1/gstreamer1/gstreamer1.mk
@@ -10,6 +10,8 @@ GSTREAMER1_SITE = https://gstreamer.freedesktop.org/src/gstreamer
 GSTREAMER1_INSTALL_STAGING = YES
 GSTREAMER1_LICENSE_FILES = COPYING
 GSTREAMER1_LICENSE = LGPL-2.0+, LGPL-2.1+
+GSTREAMER1_CPE_ID_VENDOR = gstreamer_project
+GSTREAMER1_CPE_ID_PRODUCT = gstreamer
 
 GSTREAMER1_CONF_OPTS = \
 	-Dexamples=disabled \
-- 
2.30.2
