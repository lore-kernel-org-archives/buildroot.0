From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri, 29 Jan 2021 22:48:48 +0100
Subject: [Buildroot] [PATCH 1/1] package/spice: set SPICE_CPE_ID_VALID
Message-ID: <20210129214848.1030844-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:spice_project:spice is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Aspice_project%3Aspice

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/spice/spice.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/spice/spice.mk b/package/spice/spice.mk
index 78d397bdc0..db05bd67f0 100644
--- a/package/spice/spice.mk
+++ b/package/spice/spice.mk
@@ -9,6 +9,7 @@ SPICE_SOURCE = spice-$(SPICE_VERSION).tar.bz2
 SPICE_SITE = http://www.spice-space.org/download/releases/spice-server
 SPICE_LICENSE = LGPL-2.1+
 SPICE_LICENSE_FILES = COPYING
+SPICE_CPE_ID_VALID = YES
 SPICE_INSTALL_STAGING = YES
 SPICE_DEPENDENCIES = \
 	host-pkgconf \
-- 
2.29.2
