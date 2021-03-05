From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri,  5 Mar 2021 10:46:55 +0100
Subject: [Buildroot] [PATCH 1/1] package/dosfstools: set
 DOSFSTOOLS_CPE_ID_VALID
Message-ID: <20210305094655.1832179-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:dosfstools_project:dosfstools is a valid CPE identifier for
this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Adosfstools_project%3Adosfstools

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/dosfstools/dosfstools.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/dosfstools/dosfstools.mk b/package/dosfstools/dosfstools.mk
index fdf973af9d..b876649b90 100644
--- a/package/dosfstools/dosfstools.mk
+++ b/package/dosfstools/dosfstools.mk
@@ -9,6 +9,7 @@ DOSFSTOOLS_SOURCE = dosfstools-$(DOSFSTOOLS_VERSION).tar.xz
 DOSFSTOOLS_SITE = https://github.com/dosfstools/dosfstools/releases/download/v$(DOSFSTOOLS_VERSION)
 DOSFSTOOLS_LICENSE = GPL-3.0+
 DOSFSTOOLS_LICENSE_FILES = COPYING
+DOSFSTOOLS_CPE_ID_VALID = YES
 DOSFSTOOLS_CONF_OPTS = --enable-compat-symlinks --exec-prefix=/
 HOST_DOSFSTOOLS_CONF_OPTS = --enable-compat-symlinks
 
-- 
2.30.0
