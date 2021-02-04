From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 4 Feb 2021 22:09:53 +0100
Subject: [Buildroot] [git commit] package/valijson: set VALIJSON_CPE_ID_VALID
Message-ID: <20210204205101.5A29B82641@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=befb0105956dca0fd7d84b4098164b894e5a789b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:valijson_project:valijson is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Avalijson_project%3Avalijson

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/valijson/valijson.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/valijson/valijson.mk b/package/valijson/valijson.mk
index b38c6319a6..29e6342a68 100644
--- a/package/valijson/valijson.mk
+++ b/package/valijson/valijson.mk
@@ -8,6 +8,7 @@ VALIJSON_VERSION = 0.3
 VALIJSON_SITE = $(call github,tristanpenman,valijson,v$(VALIJSON_VERSION))
 VALIJSON_LICENSE = BSD-2-Clause
 VALIJSON_LICENSE_FILES = LICENSE
+VALIJSON_CPE_ID_VALID = YES
 VALIJSON_INSTALL_STAGING = YES
 VALIJSON_INSTALL_TARGET = NO
 VALIJSON_DEPENDENCIES = boost
