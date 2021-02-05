From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri,  5 Feb 2021 08:46:26 +0100
Subject: [Buildroot] [PATCH 1/1] package/vala: add VALA_CPE_ID_VENDOR
Message-ID: <20210205074626.1452538-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:gnome:vala is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Agnome%3Avala

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/vala/vala.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/vala/vala.mk b/package/vala/vala.mk
index 95365faf18..93a304f19c 100644
--- a/package/vala/vala.mk
+++ b/package/vala/vala.mk
@@ -10,6 +10,7 @@ VALA_SITE = http://download.gnome.org/sources/vala/$(VALA_VERSION_MAJOR)
 VALA_SOURCE = vala-$(VALA_VERSION).tar.xz
 VALA_LICENSE = LGPL-2.1+
 VALA_LICENSE_FILES = COPYING
+VALA_CPE_ID_VENDOR = gnome
 
 HOST_VALA_DEPENDENCIES = host-bison host-flex host-libglib2
 # Yes, the autoconf script understands ':' as "xsltproc is not
-- 
2.29.2
