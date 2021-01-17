From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 17 Jan 2021 19:21:40 +0100
Subject: [Buildroot] [PATCH 1/1] package/exim: add EXIM_CPE_ID_VENDOR
Message-ID: <20210117182140.368568-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:exim:exim is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Aexim%3Aexim

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/exim/exim.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/exim/exim.mk b/package/exim/exim.mk
index 19a62f497d..53185c4bb8 100644
--- a/package/exim/exim.mk
+++ b/package/exim/exim.mk
@@ -9,6 +9,7 @@ EXIM_SOURCE = exim-$(EXIM_VERSION).tar.xz
 EXIM_SITE = https://ftp.exim.org/pub/exim/exim4
 EXIM_LICENSE = GPL-2.0+
 EXIM_LICENSE_FILES = LICENCE
+EXIM_CPE_ID_VENDOR = exim
 EXIM_DEPENDENCIES = host-berkeleydb host-pcre pcre berkeleydb host-pkgconf
 
 # Modify a variable value. It must already exist in the file, either
-- 
2.29.2
