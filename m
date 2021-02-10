From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 10 Feb 2021 20:05:46 +0100
Subject: [Buildroot] [git commit] package/ngircd: add NGIRCD_CPE_ID_VENDOR
Message-ID: <20210210184454.1438581561@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a7bd76b6f5224ad78d344b6f8f0e065720c9ddb7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:barton:ngircd is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Abarton%3Angircd

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ngircd/ngircd.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/ngircd/ngircd.mk b/package/ngircd/ngircd.mk
index 5e31ae7d3a..47d8ef2265 100644
--- a/package/ngircd/ngircd.mk
+++ b/package/ngircd/ngircd.mk
@@ -9,6 +9,7 @@ NGIRCD_SOURCE = ngircd-$(NGIRCD_VERSION).tar.xz
 NGIRCD_SITE = https://arthur.barton.de/pub/ngircd
 NGIRCD_LICENSE = GPL-2.0+
 NGIRCD_LICENSE_FILES = COPYING
+NGIRCD_CPE_ID_VENDOR = barton
 
 ifeq ($(BR2_PACKAGE_LINUX_PAM),y)
 NGIRCD_CONF_OPTS += --with-pam=$(STAGING_DIR)/usr
