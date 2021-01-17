From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 17 Jan 2021 14:53:20 +0100
Subject: [Buildroot] [git commit] package/libesmtp: set LIBESMTP_CPE_ID_VALID
Message-ID: <20210117133635.5F9018267B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5b0a0ec3c6281e56042e619505ddf7e3f1f6a63e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:libesmtp_project:libesmtp is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Alibesmtp_project%3Alibesmtp

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libesmtp/libesmtp.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libesmtp/libesmtp.mk b/package/libesmtp/libesmtp.mk
index 9c336793a4..ad896fc943 100644
--- a/package/libesmtp/libesmtp.mk
+++ b/package/libesmtp/libesmtp.mk
@@ -12,5 +12,6 @@ LIBESMTP_CONFIG_SCRIPTS = libesmtp-config
 LIBESMTP_DEPENDENCIES = $(if $(BR2_PACKAGE_OPENSSL),openssl)
 LIBESMTP_LICENSE = GPL-2.0+ (examples), LGPL-2.1+ (library)
 LIBESMTP_LICENSE_FILES = COPYING COPYING.LIB
+LIBESMTP_CPE_ID_VALID = YES
 
 $(eval $(autotools-package))
