From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 17 Jan 2021 10:00:11 +0100
Subject: [Buildroot] [git commit] package/civetweb: set CIVETWEB_CPE_ID_VALID
Message-ID: <20210117084213.00DDD7FACB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6d5304270e3936051c3b4ca69aac2aef00095d1d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:civetweb_project:civetweb is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Acivetweb_project%3Acivetweb

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/civetweb/civetweb.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/civetweb/civetweb.mk b/package/civetweb/civetweb.mk
index c0cbdb4a20..2cabee3736 100644
--- a/package/civetweb/civetweb.mk
+++ b/package/civetweb/civetweb.mk
@@ -8,6 +8,7 @@ CIVETWEB_VERSION = 1.13
 CIVETWEB_SITE = $(call github,civetweb,civetweb,v$(CIVETWEB_VERSION))
 CIVETWEB_LICENSE = MIT
 CIVETWEB_LICENSE_FILES = LICENSE.md
+CIVETWEB_CPE_ID_VALID = YES
 
 CIVETWEB_CONF_OPTS = TARGET_OS=LINUX WITH_IPV6=1 \
 	$(if $(BR2_INSTALL_LIBSTDCPP),WITH_CPP=1)
