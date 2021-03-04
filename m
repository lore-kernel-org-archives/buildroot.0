From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 4 Mar 2021 19:53:35 +0100
Subject: [Buildroot] [git commit] package/iucode-tool: set
 IUCODE_TOOL_CPE_ID_VALID
Message-ID: <20210304183428.8892187055@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=30c250eb5918e4dec82385b252e55750ba4eab4f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:iucode-tool_project:iucode-tool is a valid CPE identifier for
this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Aiucode-tool_project%3Aiucode-tool

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
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
