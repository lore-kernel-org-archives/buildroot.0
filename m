From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 29 Mar 2021 22:10:25 +0200
Subject: [Buildroot] [PATCH 1/2] package/haserl: add HASERL_CPE_ID_VENDOR
Message-ID: <20210329201026.254940-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:haserl_project:hserl is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Ahaserl_project%3Ahaserl

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/haserl/haserl.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/haserl/haserl.mk b/package/haserl/haserl.mk
index 4c24b9bcea..a03afbd61d 100644
--- a/package/haserl/haserl.mk
+++ b/package/haserl/haserl.mk
@@ -8,6 +8,7 @@ HASERL_VERSION = 0.9.35
 HASERL_SITE = http://downloads.sourceforge.net/project/haserl/haserl-devel
 HASERL_LICENSE = GPL-2.0
 HASERL_LICENSE_FILES = COPYING
+HASERL_CPE_ID_VENDOR = haserl_project
 HASERL_DEPENDENCIES = host-pkgconf
 
 ifeq ($(BR2_PACKAGE_HASERL_WITH_LUA),y)
-- 
2.30.2
