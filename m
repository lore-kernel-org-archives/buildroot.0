From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 16 Jan 2021 21:56:51 +0100
Subject: [Buildroot] [git commit] package/json-c: set JSON_C_CPE_ID_VALID
Message-ID: <20210116203845.ED88887B81@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3f2797b2eb0f692ce8a3751d1e789df6519e3548
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:json-c_project:json-c is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Ajson-c_project%3Ajson-c

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/json-c/json-c.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/json-c/json-c.mk b/package/json-c/json-c.mk
index 5e27c9b23b..a55831432a 100644
--- a/package/json-c/json-c.mk
+++ b/package/json-c/json-c.mk
@@ -9,6 +9,7 @@ JSON_C_SITE = https://s3.amazonaws.com/json-c_releases/releases
 JSON_C_INSTALL_STAGING = YES
 JSON_C_LICENSE = MIT
 JSON_C_LICENSE_FILES = COPYING
+JSON_C_CPE_ID_VALID = YES
 
 $(eval $(cmake-package))
 $(eval $(host-cmake-package))
