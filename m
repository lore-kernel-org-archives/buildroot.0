From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 3 Mar 2021 13:42:00 +0100
Subject: [Buildroot] [git commit] package/liburiparser: add CPE variables
Message-ID: <20210303122740.D1355862AD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e1d4b088fbbdfbde89c93ceef541029475bfb3ba
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:uriparser_project:uriparser is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Auriparser_project%3Auriparser

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/liburiparser/liburiparser.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/liburiparser/liburiparser.mk b/package/liburiparser/liburiparser.mk
index e333354ecc..4ba1e051e3 100644
--- a/package/liburiparser/liburiparser.mk
+++ b/package/liburiparser/liburiparser.mk
@@ -9,6 +9,8 @@ LIBURIPARSER_SOURCE = uriparser-$(LIBURIPARSER_VERSION).tar.bz2
 LIBURIPARSER_SITE = https://github.com/uriparser/uriparser/releases/download/uriparser-$(LIBURIPARSER_VERSION)
 LIBURIPARSER_LICENSE = BSD-3-Clause
 LIBURIPARSER_LICENSE_FILES = COPYING
+LIBURIPARSER_CPE_ID_VENDOR = uriparser_project
+LIBURIPARSER_CPE_ID_PRODUCT = uriparser
 LIBURIPARSER_INSTALL_STAGING = YES
 LIBURIPARSER_CONF_OPTS = -DURIPARSER_BUILD_DOCS=OFF -DURIPARSER_BUILD_TESTS=OFF
 
