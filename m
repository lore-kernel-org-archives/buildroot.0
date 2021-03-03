From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Wed,  3 Mar 2021 10:27:15 +0100
Subject: [Buildroot] [PATCH 1/1] package/pango: add PANGO_CPE_ID_VENDOR
Message-ID: <20210303092715.468916-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:pango:pango is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Apango%3Apango

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/pango/pango.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/pango/pango.mk b/package/pango/pango.mk
index d719b76594..803e46f193 100644
--- a/package/pango/pango.mk
+++ b/package/pango/pango.mk
@@ -11,6 +11,7 @@ PANGO_SITE = http://ftp.gnome.org/pub/GNOME/sources/pango/$(PANGO_VERSION_MAJOR)
 PANGO_INSTALL_STAGING = YES
 PANGO_LICENSE = LGPL-2.0+
 PANGO_LICENSE_FILES = COPYING
+PANGO_CPE_ID_VENDOR = pango
 
 PANGO_CONF_OPTS = -Duse_fontconfig=true
 HOST_PANGO_CONF_OPTS = -Duse_fontconfig=true -Dintrospection=disabled
-- 
2.30.0
