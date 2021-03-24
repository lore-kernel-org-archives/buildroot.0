From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 24 Mar 2021 14:07:07 +0100
Subject: [Buildroot] [git commit branch/2021.02.x] package/davfs2: add
 DAVFS2_CPE_ID_VENDOR
Message-ID: <20210324133906.65BC18862E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=029ffafc614d08400962994f3f306f883efd90f8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

cpe:2.3:a:werner_baumann:davfs2 is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Awerner_baumann%3Adavfs2

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 58134c1570963e61ca5dd60f2ec104c275a1fcf2)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/davfs2/davfs2.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/davfs2/davfs2.mk b/package/davfs2/davfs2.mk
index 1099f1b13b..9b96140fd8 100644
--- a/package/davfs2/davfs2.mk
+++ b/package/davfs2/davfs2.mk
@@ -8,6 +8,7 @@ DAVFS2_VERSION = 1.6.0
 DAVFS2_SITE = http://download.savannah.nongnu.org/releases/davfs2
 DAVFS2_LICENSE = GPL-3.0+
 DAVFS2_LICENSE_FILES = COPYING
+DAVFS2_CPE_ID_VENDOR = werner_baumann
 
 DAVFS2_DEPENDENCIES = \
 	neon \
