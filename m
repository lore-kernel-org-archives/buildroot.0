From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 16 Jan 2021 21:56:52 +0100
Subject: [Buildroot] [git commit] package/libcap-ng: set
 LIBCAP_NG_CPE_ID_VALID
Message-ID: <20210116203846.0447E87B81@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=796b5ec21ded8bbfdf28a5441e4a7e1d063cc92b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:libcap-ng_project:libcap-ng is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Alibcap-ng_project%3Alibcap-ng

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libcap-ng/libcap-ng.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libcap-ng/libcap-ng.mk b/package/libcap-ng/libcap-ng.mk
index 88623ae96b..d4c9336e2b 100644
--- a/package/libcap-ng/libcap-ng.mk
+++ b/package/libcap-ng/libcap-ng.mk
@@ -8,6 +8,7 @@ LIBCAP_NG_VERSION = 0.8.2
 LIBCAP_NG_SITE = http://people.redhat.com/sgrubb/libcap-ng
 LIBCAP_NG_LICENSE = GPL-2.0+ (programs), LGPL-2.1+ (library)
 LIBCAP_NG_LICENSE_FILES = COPYING COPYING.LIB
+LIBCAP_NG_CPE_ID_VALID = YES
 LIBCAP_NG_INSTALL_STAGING = YES
 
 LIBCAP_NG_CONF_ENV = ac_cv_prog_swig_found=no
