From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu,  4 Mar 2021 12:26:11 +0100
Subject: [Buildroot] [PATCH 1/1] package/iucode-tool: set
 IUCODE_TOOL_CPE_ID_VALID
Message-ID: <20210304112611.1235277-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:iucode-tool_project:iucode-tool is a valid CPE identifier for
this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Aiucode-tool_project%3Aiucode-tool

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/iucode-tool/iucode-tool.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/iucode-tool/iucode-tool.mk b/package/iucode-tool/iucode-tool.mk
index bddc37295c..64229ccc0f 100644
--- a/package/iucode-tool/iucode-tool.mk
+++ b/package/iucode-tool/iucode-tool.mk
@@ -12,6 +12,7 @@ IUCODE_TOOL_DEPENDENCIES = argp-standalone
 endif
 IUCODE_TOOL_LICENSE = GPL-2.0+
 IUCODE_TOOL_LICENSE_FILES = COPYING
+IUCODE_TOOL_CPE_ID_VALID = YES
 
 define IUCODE_TOOL_INSTALL_INIT_SYSV
 	$(INSTALL) -D -m 0755 package/iucode-tool/S00iucode-tool \
-- 
2.30.0
