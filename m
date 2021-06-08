From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 8 Jun 2021 08:10:59 +0200
Subject: [Buildroot] [git commit branch/2021.02.x] package/libical: add
 LIBICAL_CPE_ID_VENDOR
Message-ID: <20210608064256.E7A79886B5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1650cce4634d864d037bf651098d2932bb9b5793
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

cpe:2.3:a:libical_project:libical is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Alibical_project%3Alibical

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit c95d3d8ab8f8c057cb57204419dd9b6445a92622)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libical/libical.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libical/libical.mk b/package/libical/libical.mk
index f9a266026e..afbbfd98c8 100644
--- a/package/libical/libical.mk
+++ b/package/libical/libical.mk
@@ -9,6 +9,7 @@ LIBICAL_SITE = https://github.com/libical/libical/releases/download/v$(LIBICAL_V
 LIBICAL_INSTALL_STAGING = YES
 LIBICAL_LICENSE = MPL-1.0 or LGPL-2.1
 LIBICAL_LICENSE_FILES = LICENSE
+LIBICAL_CPE_ID_VENDOR = libical_project
 
 # 0002-icaltypes-c-icalreqstattype_from_string-copy-the-reqstattype.patch
 LIBICAL_IGNORE_CVES += CVE-2016-9584
