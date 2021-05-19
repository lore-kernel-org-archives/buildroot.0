From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 19 May 2021 21:51:06 +0200
Subject: [Buildroot] [git commit branch/2021.02.x] package/keepalived: add
 KEEPALIVED_CPE_ID_VENDOR
Message-ID: <20210519192209.CDEB188778@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7bcfdd676bb621b533e2f0c5c85b5814fc75471b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

cpe:2.3:a:keepalived:keepalived is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Akeepalived%3Akeepalived

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 00cb0f00fa6c5e992097c6cb6188da4606bac7a9)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/keepalived/keepalived.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/keepalived/keepalived.mk b/package/keepalived/keepalived.mk
index 1a42d0c880..5d42cab741 100644
--- a/package/keepalived/keepalived.mk
+++ b/package/keepalived/keepalived.mk
@@ -9,6 +9,7 @@ KEEPALIVED_SITE = http://www.keepalived.org/software
 KEEPALIVED_DEPENDENCIES = host-pkgconf openssl
 KEEPALIVED_LICENSE = GPL-2.0+
 KEEPALIVED_LICENSE_FILES = COPYING
+KEEPALIVED_CPE_ID_VENDOR = keepalived
 KEEPALIVED_CONF_OPTS = --disable-hardening
 
 ifeq ($(BR2_PACKAGE_JSON_C),y)
