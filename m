From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat,  6 Feb 2021 11:39:27 +0100
Subject: [Buildroot] [PATCH 1/1] package/raptor: add CPE variables
Message-ID: <20210206103927.1962573-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:librdf:raptor_rdf_syntax_library is a valid CPE identifier for
this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Alibrdf%3Araptor_rdf_syntax_library

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/raptor/raptor.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/raptor/raptor.mk b/package/raptor/raptor.mk
index d674627f90..6d21fad58e 100644
--- a/package/raptor/raptor.mk
+++ b/package/raptor/raptor.mk
@@ -10,6 +10,8 @@ RAPTOR_SITE = http://download.librdf.org/source
 RAPTOR_DEPENDENCIES = libxml2 libxslt
 RAPTOR_LICENSE = GPL-2.0+ or LGPL-2.1+ or Apache-2.0+
 RAPTOR_LICENSE_FILES = LICENSE.txt
+RAPTOR_CPE_ID_VENDOR = librdf
+RAPTOR_CPE_ID_PRODUCT = raptor_rdf_syntax_library
 RAPTOR_INSTALL_STAGING = YES
 
 # Flag is added to make sure the patch is applied for the configure.ac of raptor.
-- 
2.29.2
