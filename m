From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 17 Jul 2021 11:00:37 +0200
Subject: [Buildroot] [PATCH 1/1] package/trinity: add TRINITY_CPE_ID_VENDOR
Message-ID: <20210717090037.670285-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

cpe:2.3:a:trinity_project:trinity is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Atrinity_project%3Atrinity

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/trinity/trinity.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/trinity/trinity.mk b/package/trinity/trinity.mk
index adf7d1455c..befb8de826 100644
--- a/package/trinity/trinity.mk
+++ b/package/trinity/trinity.mk
@@ -9,6 +9,7 @@ TRINITY_SITE = http://codemonkey.org.uk/projects/trinity
 TRINITY_SOURCE = trinity-$(TRINITY_VERSION).tar.xz
 TRINITY_LICENSE = GPL-2.0
 TRINITY_LICENSE_FILES = COPYING
+TRINITY_CPE_ID_VENDOR = trinity_project
 
 define TRINITY_CONFIGURE_CMDS
 	(cd $(@D); $(TARGET_CONFIGURE_OPTS) ./configure)
-- 
2.30.2
