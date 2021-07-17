From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 17 Jul 2021 11:53:48 +0200
Subject: [Buildroot] [git commit] package/pcre2: add PCRE2_CPE_ID_VENDOR
Message-ID: <20210717092413.E9CF09124D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

commit: https://git.buildroot.net/buildroot/commit/?id=c9bfe7b19efa18d3c23aaf2f42628ac48846c18c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:pcre:pcre2 is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Apcre%3Apcre2

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
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
 
