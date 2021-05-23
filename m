From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 23 May 2021 10:59:02 +0200
Subject: [Buildroot] [git commit] package/pwgen: add PWGEN_CPE_ID_VENDOR
Message-ID: <20210523083320.6FF0C890A7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=eb72fa0d3cfe73217a96329c6b190cbfde63971c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:pwgen_project:pwgen is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Apwgen_project%3Apwgen

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/pwgen/pwgen.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/pwgen/pwgen.mk b/package/pwgen/pwgen.mk
index ad9465b82c..89925bb300 100644
--- a/package/pwgen/pwgen.mk
+++ b/package/pwgen/pwgen.mk
@@ -8,6 +8,7 @@ PWGEN_VERSION = 2.08
 PWGEN_SITE = http://downloads.sourceforge.net/project/pwgen/pwgen/$(PWGEN_VERSION)
 PWGEN_LICENSE = GPL-2.0
 PWGEN_LICENSE_FILES = debian/copyright
+PWGEN_CPE_ID_VENDOR = pwgen_project
 
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
