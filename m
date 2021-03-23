From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 23 Mar 2021 22:29:44 +0100
Subject: [Buildroot] [git commit branch/2021.02.x] pcmanfm: add
 PCMANFM_CPE_ID_VENDOR
Message-ID: <20210323213736.6BAB488FAD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=75997ef8e0addd462622e396fa6c7c095a9fc009
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

cpe:2.3:a:pcmanfm_project:pcmanfm is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Apcmanfm_project%3Apcmanfm

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit b85f8e28994029ceaaa0a03e429eabb7204390d6)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pcmanfm/pcmanfm.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/pcmanfm/pcmanfm.mk b/package/pcmanfm/pcmanfm.mk
index 1d946ba521..aecc438e5f 100644
--- a/package/pcmanfm/pcmanfm.mk
+++ b/package/pcmanfm/pcmanfm.mk
@@ -10,6 +10,7 @@ PCMANFM_SITE = http://sourceforge.net/projects/pcmanfm/files
 PCMANFM_DEPENDENCIES = libglib2 menu-cache libfm $(TARGET_NLS_DEPENDENCIES)
 PCMANFM_LICENSE = GPL-2.0+
 PCMANFM_LICENSE_FILES = COPYING
+PCMANFM_CPE_ID_VENDOR = pcmanfm_project
 PCMANFM_CONF_ENV = LIBS=$(TARGET_NLS_LIBS)
 
 ifeq ($(BR2_PACKAGE_LIBGTK3_X11),y)
