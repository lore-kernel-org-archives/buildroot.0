From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu, 20 May 2021 21:06:08 +0200
Subject: [Buildroot] [PATCH 1/1] package/less: add LESS_CPE_ID_VENDOR
Message-ID: <20210520190608.182162-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:gnu:less is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Agnu%3Aless

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/less/less.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/less/less.mk b/package/less/less.mk
index 89962f9529..a15bd25bec 100644
--- a/package/less/less.mk
+++ b/package/less/less.mk
@@ -8,6 +8,7 @@ LESS_VERSION = 563
 LESS_SITE = http://www.greenwoodsoftware.com/less
 LESS_LICENSE = GPL-3.0+
 LESS_LICENSE_FILES = COPYING
+LESS_CPE_ID_VENDOR = gnu
 LESS_DEPENDENCIES = ncurses
 
 define LESS_INSTALL_TARGET_CMDS
-- 
2.30.2
