From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 17 Jan 2021 17:44:38 +0100
Subject: [Buildroot] [PATCH 1/1] package/mono: add MONO_CPE_ID_VENDOR
Message-ID: <20210117164438.354311-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:mono-project:mono is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Amono-project%3Amono

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/mono/mono.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/mono/mono.mk b/package/mono/mono.mk
index c53025a69f..df3481a498 100644
--- a/package/mono/mono.mk
+++ b/package/mono/mono.mk
@@ -10,6 +10,7 @@ MONO_SOURCE = mono-$(MONO_VERSION).tar.xz
 MONO_LICENSE = GPL-2.0 or MIT (compiler, tools), MIT (libs) or commercial
 MONO_LICENSE_FILES = LICENSE mcs/COPYING \
 	external/Newtonsoft.Json/Tools/7-zip/copying.txt
+MONO_CPE_ID_VENDOR = mono-project
 MONO_INSTALL_STAGING = YES
 
 ## Mono native
-- 
2.29.2
