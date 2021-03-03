From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 3 Mar 2021 13:39:29 +0100
Subject: [Buildroot] [git commit] package/libmodplug: add
 LIBMODPLUG_CPE_ID_VENDOR
Message-ID: <20210303122740.6C8BF862AD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=266b935349a04a8367a7b1c08d097786da18a436
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:konstanty_bialkowski:libmodplug is a valid CPE identifier for
this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Akonstanty_bialkowski%3Alibmodplug

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libmodplug/libmodplug.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libmodplug/libmodplug.mk b/package/libmodplug/libmodplug.mk
index 05786ce812..98c38a3b00 100644
--- a/package/libmodplug/libmodplug.mk
+++ b/package/libmodplug/libmodplug.mk
@@ -9,5 +9,6 @@ LIBMODPLUG_SITE = http://downloads.sourceforge.net/project/modplug-xmms/libmodpl
 LIBMODPLUG_INSTALL_STAGING = YES
 LIBMODPLUG_LICENSE = Public Domain
 LIBMODPLUG_LICENSE_FILES = COPYING
+LIBMODPLUG_CPE_ID_VENDOR = konstanty_bialkowski
 
 $(eval $(autotools-package))
