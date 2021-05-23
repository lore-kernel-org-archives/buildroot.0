From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 23 May 2021 19:48:39 +0200
Subject: [Buildroot] [git commit] package/oprofile: add
 OPROFILE_CPE_ID_VENDOR
Message-ID: <20210523172850.5CA788142B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bd5dabce4c229cb472b61390e76da9fa9abd28df
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:maynard_johnson:oprofile is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Amaynard_johnson%3Aoprofile

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/oprofile/oprofile.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/oprofile/oprofile.mk b/package/oprofile/oprofile.mk
index 50693ddd1e..85bc4efa9b 100644
--- a/package/oprofile/oprofile.mk
+++ b/package/oprofile/oprofile.mk
@@ -8,6 +8,7 @@ OPROFILE_VERSION = 1.4.0
 OPROFILE_SITE = http://downloads.sourceforge.net/project/oprofile/oprofile/oprofile-$(OPROFILE_VERSION)
 OPROFILE_LICENSE = GPL-2.0+
 OPROFILE_LICENSE_FILES = COPYING
+OPROFILE_CPE_ID_VENDOR = maynard_johnson
 OPROFILE_CONF_OPTS = \
 	--disable-account-check \
 	--enable-gui=no \
