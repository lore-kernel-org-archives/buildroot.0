From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 20 Jul 2021 20:27:55 +0200
Subject: [Buildroot] [git commit] package/lrzsz: add LRZSZ_CPE_ID_VENDOR
Message-ID: <20210720175435.7CA25884D3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

commit: https://git.buildroot.net/buildroot/commit/?id=2352c827311aefbbd83459bfaf359dff8c0fa7df
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:lrzsz_project:lrzsz is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Alrzsz_project%3Alrzsz

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/lrzsz/lrzsz.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/lrzsz/lrzsz.mk b/package/lrzsz/lrzsz.mk
index 6c68232852..45c88619e0 100644
--- a/package/lrzsz/lrzsz.mk
+++ b/package/lrzsz/lrzsz.mk
@@ -9,6 +9,7 @@ LRZSZ_SITE = http://www.ohse.de/uwe/releases
 LRZSZ_CONF_OPTS = --disable-timesync
 LRZSZ_LICENSE = GPL-2.0+
 LRZSZ_LICENSE_FILES = COPYING
+LRZSZ_CPE_ID_VENDOR = lrzsz_project
 LRZSZ_DEPENDENCIES = $(TARGET_NLS_DEPENDENCIES)
 LRZSZ_CONF_ENV = LIBS=$(TARGET_NLS_LIBS)
 
