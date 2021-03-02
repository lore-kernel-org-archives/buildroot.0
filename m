From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue,  2 Mar 2021 10:26:42 +0100
Subject: [Buildroot] [PATCH 1/1] package/bubblewwrap: add
 BUBBLEWRAP_CPE_ID_VENDOR
Message-ID: <20210302092642.291296-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:projectatomic:bubblewrap is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Aprojectatomic%3Abubblewrap

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/bubblewrap/bubblewrap.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/bubblewrap/bubblewrap.mk b/package/bubblewrap/bubblewrap.mk
index 388f64880e..f27d28bdf0 100644
--- a/package/bubblewrap/bubblewrap.mk
+++ b/package/bubblewrap/bubblewrap.mk
@@ -12,6 +12,8 @@ BUBBLEWRAP_DEPENDENCIES = host-pkgconf libcap
 BUBBLEWRAP_LICENSE = LGPL-2.0+
 BUBBLEWRAP_LICENSE_FILES = COPYING
 
+BUBBLEWRAP_CPE_ID_VENDOR = projectatomic
+
 BUBBLEWRAP_CONF_OPTS = \
 	--enable-require-userns=no \
 	--disable-man \
-- 
2.30.0
