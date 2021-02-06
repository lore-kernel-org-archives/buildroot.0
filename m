From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 6 Feb 2021 14:51:24 +0100
Subject: [Buildroot] [git commit] package/raptor: add CPE variables
Message-ID: <20210206133111.73113802E0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=53e7998deed7cf4d330afa336e5c78a889a8f669
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:librdf:raptor_rdf_syntax_library is a valid CPE identifier for
this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Alibrdf%3Araptor_rdf_syntax_library

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
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
