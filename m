From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 2 Mar 2021 14:01:04 +0100
Subject: [Buildroot] [git commit] package/libsndfile: set
 LIBSNDFILE_CPE_ID_VALID
Message-ID: <20210302123842.0F70E86491@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b84a4ed139dd50be66283b9eb65679d5da0c2f24
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:libsndfile_project:libsndfile is a valid CPE identifier for
this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Alibsndfile_project%3Alibsndfile

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/libsndfile/libsndfile.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libsndfile/libsndfile.mk b/package/libsndfile/libsndfile.mk
index 7d1dca0599..cdaa01de35 100644
--- a/package/libsndfile/libsndfile.mk
+++ b/package/libsndfile/libsndfile.mk
@@ -9,6 +9,7 @@ LIBSNDFILE_SITE = http://www.mega-nerd.com/libsndfile/files
 LIBSNDFILE_INSTALL_STAGING = YES
 LIBSNDFILE_LICENSE = LGPL-2.1+
 LIBSNDFILE_LICENSE_FILES = COPYING
+LIBSNDFILE_CPE_ID_VALID = YES
 
 # 0001-double64_init-Check-psf-sf.channels-against-upper-bo.patch
 LIBSNDFILE_IGNORE_CVES += CVE-2017-14634
