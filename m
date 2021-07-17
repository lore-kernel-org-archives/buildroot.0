From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 17 Jul 2021 11:39:14 +0200
Subject: [Buildroot] [PATCH v3,1/1] package/pcre2: add PCRE2_CPE_ID_VENDOR
Message-ID: <20210717093914.954546-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

cpe:2.3:a:pcre:pcre2 is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Apcre%3Apcre2

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v2 -> v3:
 - Fix title again (pcre -> pcre2)
Changes v1 -> v2:
 - Fix title (PCRE -> PCRE2)

 package/pcre2/pcre2.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/pcre2/pcre2.mk b/package/pcre2/pcre2.mk
index 858ef59703..d02772650f 100644
--- a/package/pcre2/pcre2.mk
+++ b/package/pcre2/pcre2.mk
@@ -9,6 +9,7 @@ PCRE2_SITE = https://ftp.pcre.org/pub/pcre
 PCRE2_SOURCE = pcre2-$(PCRE2_VERSION).tar.bz2
 PCRE2_LICENSE = BSD-3-Clause
 PCRE2_LICENSE_FILES = LICENCE
+PCRE2_CPE_ID_VENDOR = pcre
 PCRE2_INSTALL_STAGING = YES
 PCRE2_CONFIG_SCRIPTS = pcre2-config
 
-- 
2.30.2
