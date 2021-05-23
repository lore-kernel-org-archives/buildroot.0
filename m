From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 23 May 2021 20:27:22 +0200
Subject: [Buildroot] [git commit branch/2021.02.x] package/less: add
 LESS_CPE_ID_VENDOR
Message-ID: <20210523180930.DE1238A275@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b9fbcc6be971f4a3c2d0b223154bd683f98eb43e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

cpe:2.3:a:gnu:less is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Agnu%3Aless

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 0030cbd43094650481a6a0381b0a573903bd1cb9)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/less/less.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/less/less.mk b/package/less/less.mk
index 89962f9529..a15bd25bec 100644
--- a/package/less/less.mk
+++ b/package/less/less.mk
@@ -8,6 +8,7 @@ LESS_VERSION = 563
 LESS_SITE = http://www.greenwoodsoftware.com/less
 LESS_LICENSE = GPL-3.0+
 LESS_LICENSE_FILES = COPYING
+LESS_CPE_ID_VENDOR = gnu
 LESS_DEPENDENCIES = ncurses
 
 define LESS_INSTALL_TARGET_CMDS
