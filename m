From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 4 Mar 2021 19:53:34 +0100
Subject: [Buildroot] [git commit] package/lame: set LAME_CPE_ID_VALID
Message-ID: <20210304183428.7B7D181370@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0029c467fe9e054ac577bf8407260dc95cd7a5cc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:lame_project:lame is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Alame_project%3Alame

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/lame/lame.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/lame/lame.mk b/package/lame/lame.mk
index 3d76ab93ac..206e4407c9 100644
--- a/package/lame/lame.mk
+++ b/package/lame/lame.mk
@@ -12,6 +12,7 @@ LAME_CONF_ENV = GTK_CONFIG=/bin/false
 LAME_CONF_OPTS = --enable-dynamic-frontends
 LAME_LICENSE = LGPL-2.0+
 LAME_LICENSE_FILES = COPYING
+LAME_CPE_ID_VALID = YES
 
 ifeq ($(BR2_PACKAGE_LIBSNDFILE),y)
 LAME_DEPENDENCIES += libsndfile
