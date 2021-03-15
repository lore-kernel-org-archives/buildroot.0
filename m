From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 15 Mar 2021 20:16:56 +0100
Subject: [Buildroot] [PATCH v2,3/4] pcmanfm: add PCMANFM_CPE_ID_VENDOR
In-Reply-To: <20210315191657.2150193-1-fontaine.fabrice@gmail.com>
References: <20210315191657.2150193-1-fontaine.fabrice@gmail.com>
Message-ID: <20210315191657.2150193-3-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:pcmanfm_project:pcmanfm is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Apcmanfm_project%3Apcmanfm

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/pcmanfm/pcmanfm.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/pcmanfm/pcmanfm.mk b/package/pcmanfm/pcmanfm.mk
index cb69f60d42..1379b19f5d 100644
--- a/package/pcmanfm/pcmanfm.mk
+++ b/package/pcmanfm/pcmanfm.mk
@@ -10,6 +10,7 @@ PCMANFM_SITE = http://sourceforge.net/projects/pcmanfm/files
 PCMANFM_DEPENDENCIES = libglib2 menu-cache libfm $(TARGET_NLS_DEPENDENCIES)
 PCMANFM_LICENSE = GPL-2.0+
 PCMANFM_LICENSE_FILES = COPYING
+PCMANFM_CPE_ID_VENDOR = pcmanfm_project
 PCMANFM_CONF_ENV = LIBS=$(TARGET_NLS_LIBS)
 
 ifeq ($(BR2_PACKAGE_LIBGTK3_X11),y)
-- 
2.30.0
