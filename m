From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 24 Feb 2017 11:57:08 +0100
Subject: [Buildroot] [git commit] package/libepoxy: needs host-pkgconf
Message-ID: <20170224105714.DCA3B81975@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6cda6506ad9c0505c8a154b12daf1c71551977f7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

configure.ac uses PKG_CHECK_MODULES() so it needs host-pkgconf.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libepoxy/libepoxy.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libepoxy/libepoxy.mk b/package/libepoxy/libepoxy.mk
index 7436e8f..1dd583e 100644
--- a/package/libepoxy/libepoxy.mk
+++ b/package/libepoxy/libepoxy.mk
@@ -9,7 +9,7 @@ LIBEPOXY_SITE = $(call github,anholt,libepoxy,$(LIBEPOXY_VERSION))
 LIBEPOXY_INSTALL_STAGING = YES
 # For patches 0001-0006:
 LIBEPOXY_AUTORECONF = YES
-LIBEPOXY_DEPENDENCIES = xutil_util-macros
+LIBEPOXY_DEPENDENCIES = host-pkgconf xutil_util-macros
 LIBEPOXY_LICENSE = MIT
 LIBEPOXY_LICENSE_FILES = COPYING
 
