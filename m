From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 6 Mar 2021 11:18:24 +0100
Subject: [Buildroot] [git commit] package/libmodsecurity: add CPE variables
Message-ID: <20210306095745.4D2D1813BB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=87c9fd60d4a91018e34da678b60f0829526d6fda
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:trustwave:modsecurity is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Atrustwave%3Amodsecurity

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libmodsecurity/libmodsecurity.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/libmodsecurity/libmodsecurity.mk b/package/libmodsecurity/libmodsecurity.mk
index 063f969fc6..a84cd27b34 100644
--- a/package/libmodsecurity/libmodsecurity.mk
+++ b/package/libmodsecurity/libmodsecurity.mk
@@ -10,6 +10,8 @@ LIBMODSECURITY_SITE = https://github.com/SpiderLabs/ModSecurity/releases/downloa
 LIBMODSECURITY_INSTALL_STAGING = YES
 LIBMODSECURITY_LICENSE = Apache-2.0
 LIBMODSECURITY_LICENSE_FILES = LICENSE
+LIBMODSECURITY_CPE_ID_VENDOR = trustwave
+LIBMODSECURITY_CPE_ID_PRODUCT = modsecurity
 # 0002-test-for-uClinux-in-configure-script.patch
 LIBMODSECURITY_AUTORECONF = YES
 # libinjection uses AC_CHECK_FILE, not available in cross-compile
