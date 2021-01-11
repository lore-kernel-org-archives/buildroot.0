From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 11 Jan 2021 23:25:33 +0100
Subject: [Buildroot] [PATCH 1/1] package/jhead: set JHEAD_CPE_ID_VALID
Message-ID: <20210111222533.1417643-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:jhead_project:jhead is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Ajhead_project%3Ajhead

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/jhead/jhead.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/jhead/jhead.mk b/package/jhead/jhead.mk
index d56ee0daff..9c0d4d1237 100644
--- a/package/jhead/jhead.mk
+++ b/package/jhead/jhead.mk
@@ -8,6 +8,7 @@ JHEAD_VERSION = 3.04
 JHEAD_SITE = http://www.sentex.net/~mwandel/jhead
 JHEAD_LICENSE = Public Domain
 JHEAD_LICENSE_FILES = readme.txt
+JHEAD_CPE_ID_VALID = YES
 
 define JHEAD_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)
-- 
2.29.2
