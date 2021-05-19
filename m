From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 19 May 2021 17:39:19 +0200
Subject: [Buildroot] [git commit branch/2021.02.x] package/tinyxml2: add
 TINYXML2_CPE_ID_VENDOR
Message-ID: <20210519151137.C6D3182B86@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=23a24519330803c917f6abc1e74ab1e2ebca98c5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

cpe:2.3:a:tinyxml2_project:tinyxml2 is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Atinyxml2_project%3Atinyxml2

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit c00a99c292ed3cceace2f7d21821ae7bb969159d)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/tinyxml2/tinyxml2.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/tinyxml2/tinyxml2.mk b/package/tinyxml2/tinyxml2.mk
index b06d849b21..d760d54a2f 100644
--- a/package/tinyxml2/tinyxml2.mk
+++ b/package/tinyxml2/tinyxml2.mk
@@ -9,6 +9,7 @@ TINYXML2_SITE = $(call github,leethomason,tinyxml2,$(TINYXML2_VERSION))
 TINYXML2_LICENSE = Zlib
 TINYXML2_LICENSE_FILES = LICENSE.txt
 TINYXML2_INSTALL_STAGING = YES
+TINYXML2_CPE_ID_VENDOR = tinyxml2_project
 
 ifeq ($(BR2_STATIC_LIBS),y)
 TINYXML2_CONF_OPTS += -DBUILD_STATIC_LIBS=ON
