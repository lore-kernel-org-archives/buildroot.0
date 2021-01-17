From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 17 Jan 2021 17:13:35 +0100
Subject: [Buildroot] [git commit] package/haproxy: add HAPROXY_CPE_ID_VENDOR
Message-ID: <20210117155739.40B5E87590@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=680badb6dae42466183cfffd86fe66d2a7aa8018
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:haproxy:haproxy is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Ahaproxy%3Ahaproxy

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/haproxy/haproxy.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/haproxy/haproxy.mk b/package/haproxy/haproxy.mk
index a6e07c9adb..42943effbc 100644
--- a/package/haproxy/haproxy.mk
+++ b/package/haproxy/haproxy.mk
@@ -9,6 +9,7 @@ HAPROXY_VERSION = $(HAPROXY_VERSION_MAJOR).6
 HAPROXY_SITE = http://www.haproxy.org/download/$(HAPROXY_VERSION_MAJOR)/src
 HAPROXY_LICENSE = GPL-2.0+ and LGPL-2.1+ with exceptions
 HAPROXY_LICENSE_FILES = LICENSE doc/lgpl.txt doc/gpl.txt
+HAPROXY_CPE_ID_VENDOR = haproxy
 
 HAPROXY_MAKE_OPTS = \
 	LD=$(TARGET_CC) \
