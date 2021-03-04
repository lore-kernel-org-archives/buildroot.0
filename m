From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 4 Mar 2021 08:14:47 +0100
Subject: [Buildroot] [git commit] package/rpcbind: set RPCBIND_CPE_ID_VALID
Message-ID: <20210304065255.54E9E86AA7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4c8067276763957de9bc6c130ef1ba2a5cf42281
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:rpcbind_project:rpcbind is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Arpcbind_project%3Arpcbind

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/rpcbind/rpcbind.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/rpcbind/rpcbind.mk b/package/rpcbind/rpcbind.mk
index cce84cfa88..abeca2d247 100644
--- a/package/rpcbind/rpcbind.mk
+++ b/package/rpcbind/rpcbind.mk
@@ -9,6 +9,7 @@ RPCBIND_SITE = http://downloads.sourceforge.net/project/rpcbind/rpcbind/$(RPCBIN
 RPCBIND_SOURCE = rpcbind-$(RPCBIND_VERSION).tar.bz2
 RPCBIND_LICENSE = BSD-3-Clause
 RPCBIND_LICENSE_FILES = COPYING
+RPCBIND_CPE_ID_VALID = YES
 
 RPCBIND_CONF_ENV += \
 	CFLAGS="$(TARGET_CFLAGS) `$(PKG_CONFIG_HOST_BINARY) --cflags libtirpc`"
