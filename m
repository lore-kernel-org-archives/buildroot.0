From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 28 Dec 2012 22:28:02 +0100
Subject: [Buildroot] [git commit] nettle: add license info
Message-ID: <20121228213151.DFEF19A4DE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=761ae9c3e13da753318851c4c71ab7fc8aa5a9db
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/nettle/nettle.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/nettle/nettle.mk b/package/nettle/nettle.mk
index ef7640a..ae09ecc 100644
--- a/package/nettle/nettle.mk
+++ b/package/nettle/nettle.mk
@@ -2,6 +2,8 @@ NETTLE_VERSION = 2.5
 NETTLE_SITE = http://www.lysator.liu.se/~nisse/archive
 NETTLE_DEPENDENCIES = gmp
 NETTLE_INSTALL_STAGING = YES
+NETTLE_LICENSE = LGPLv2.1+
+NETTLE_LICENSE_FILES = COPYING.LIB
 
 define NETTLE_DITCH_DEBUGGING_CFLAGS
 	$(SED) '/CFLAGS/ s/ -ggdb3//' $(@D)/configure
