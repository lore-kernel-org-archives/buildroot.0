From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 22 May 2021 22:11:36 +0200
Subject: [Buildroot] [PATCH 1/1] package/proxychains-ng: add
 PROXYCHAINS_NG_CPE_ID_VENDOR
Message-ID: <20210522201136.280482-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:proxychains-ng_project:proxychains-ng is a valid CPE
identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Aproxychains-ng_project%3Aproxychains-ng

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/proxychains-ng/proxychains-ng.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/proxychains-ng/proxychains-ng.mk b/package/proxychains-ng/proxychains-ng.mk
index a9f3fc9561..0437f7d911 100644
--- a/package/proxychains-ng/proxychains-ng.mk
+++ b/package/proxychains-ng/proxychains-ng.mk
@@ -9,6 +9,7 @@ PROXYCHAINS_NG_SOURCE = proxychains-ng-$(PROXYCHAINS_NG_VERSION).tar.bz2
 PROXYCHAINS_NG_SITE = http://downloads.sourceforge.net/project/proxychains-ng
 PROXYCHAINS_NG_LICENSE = GPL-2.0+
 PROXYCHAINS_NG_LICENSE_FILES = COPYING
+PROXYCHAINS_NG_CPE_ID_VENDOR = proxychains-ng_project
 
 define PROXYCHAINS_NG_CONFIGURE_CMDS
 	cd $(@D) && \
-- 
2.30.2
