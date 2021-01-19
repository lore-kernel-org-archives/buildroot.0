From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue, 19 Jan 2021 08:10:32 +0100
Subject: [Buildroot] [PATCH 1/1] package/ncmpc: set NCMPC_CPE_ID_VALID
Message-ID: <20210119071032.786781-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:ncmpc_project:ncmpc is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Ancmpc_project%3Ancmpc

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/ncmpc/ncmpc.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/ncmpc/ncmpc.mk b/package/ncmpc/ncmpc.mk
index ddeccf7f69..c229fd298c 100644
--- a/package/ncmpc/ncmpc.mk
+++ b/package/ncmpc/ncmpc.mk
@@ -16,6 +16,7 @@ NCMPC_DEPENDENCIES = \
 	$(TARGET_NLS_DEPENDENCIES)
 NCMPC_LICENSE = GPL-2.0+
 NCMPC_LICENSE_FILES = COPYING
+NCMPC_CPE_ID_VALID = YES
 
 NCMPC_CONF_OPTS = \
 	-Dcurses=ncurses \
-- 
2.29.2
