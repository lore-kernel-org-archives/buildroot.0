From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Wed,  3 Mar 2021 10:22:03 +0100
Subject: [Buildroot] [PATCH 1/1] package/irssi: add IRSSI_CPE_ID_VENDOR
Message-ID: <20210303092203.468116-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:irssi:irssi is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Airssi%3Airssi

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/irssi/irssi.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/irssi/irssi.mk b/package/irssi/irssi.mk
index 4d7268d291..c64690c59b 100644
--- a/package/irssi/irssi.mk
+++ b/package/irssi/irssi.mk
@@ -11,6 +11,7 @@ IRSSI_SOURCE = irssi-$(IRSSI_VERSION).tar.xz
 IRSSI_SITE = https://github.com/irssi/irssi/releases/download/$(IRSSI_VERSION)
 IRSSI_LICENSE = GPL-2.0+
 IRSSI_LICENSE_FILES = COPYING
+IRSSI_CPE_ID_VENDOR = irssi
 IRSSI_DEPENDENCIES = host-pkgconf libglib2 ncurses openssl
 
 IRSSI_CONF_OPTS = \
-- 
2.30.0
