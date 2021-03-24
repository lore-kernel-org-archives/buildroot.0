From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 24 Mar 2021 14:06:27 +0100
Subject: [Buildroot] [git commit branch/2021.02.x] package/cracklib: add
 CRACKLIB_CPE_ID_VENDOR
Message-ID: <20210324133906.5C93387764@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c6d05bbd466860d4b2a59e2e07c105d7d7367ca9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

cpe:2.3:a:cracklib_project:cracklib is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Acracklib_project%3Acracklib

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 5575aa6f514ef97930d765df568bff704c59c2db)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/cracklib/cracklib.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/cracklib/cracklib.mk b/package/cracklib/cracklib.mk
index 91d510ff34..8e6a844f11 100644
--- a/package/cracklib/cracklib.mk
+++ b/package/cracklib/cracklib.mk
@@ -8,6 +8,7 @@ CRACKLIB_VERSION = 2.9.7
 CRACKLIB_SITE = https://github.com/cracklib/cracklib/releases/download/v$(CRACKLIB_VERSION)
 CRACKLIB_LICENSE = LGPL-2.1
 CRACKLIB_LICENSE_FILES = COPYING.LIB
+CRACKLIB_CPE_ID_VENDOR = cracklib_project
 CRACKLIB_INSTALL_STAGING = YES
 CRACKLIB_DEPENDENCIES = host-cracklib $(TARGET_NLS_DEPENDENCIES)
 CRACKLIB_CONF_ENV = LIBS=$(TARGET_NLS_LIBS)
