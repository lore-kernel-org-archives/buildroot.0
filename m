From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 16 May 2021 18:30:45 +0200
Subject: [Buildroot] [git commit] package/tinyproxy: add
 TINYPROXY_CPE_ID_VENDOR
Message-ID: <20210516161235.F2E8A86BDF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ba91be05c2582236f0073e0a4994111c1525e9fe
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:tinyproxy_project:tinyproxy is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Atinyproxy_project%3Atinyproxy

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/tinyproxy/tinyproxy.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/tinyproxy/tinyproxy.mk b/package/tinyproxy/tinyproxy.mk
index 6120d183cc..326bfa8b88 100644
--- a/package/tinyproxy/tinyproxy.mk
+++ b/package/tinyproxy/tinyproxy.mk
@@ -9,6 +9,7 @@ TINYPROXY_SITE = https://github.com/tinyproxy/tinyproxy/releases/download/$(TINY
 TINYPROXY_SOURCE = tinyproxy-$(TINYPROXY_VERSION).tar.bz2
 TINYPROXY_LICENSE = GPL-2.0+
 TINYPROXY_LICENSE_FILES = COPYING
+TINYPROXY_CPE_ID_VENDOR = tinyproxy_project
 TINYPROXY_CONF_ENV = ac_cv_path_A2X=no
 
 $(eval $(autotools-package))
