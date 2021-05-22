From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 22 May 2021 22:26:30 +0200
Subject: [Buildroot] [git commit] package/proxychains-ng: add
 PROXYCHAINS_NG_CPE_ID_VENDOR
Message-ID: <20210522200125.B947F88F1E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=53d0ca9dfb290839896fa5c78d2fe864d55a992f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:proxychains-ng_project:proxychains-ng is a valid CPE
identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Aproxychains-ng_project%3Aproxychains-ng

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
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
