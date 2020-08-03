From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 3 Aug 2020 16:37:23 +0200
Subject: [Buildroot] [git commit] package/sysdig: Fix check-package
Message-ID: <20200803143204.11C7C8158B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9c6bc9639cba5032b88419d1895c6ee69054fb66
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch fixes a couple of 'check-package' errors:

	package/sysdig/sysdig.mk:23: remove trailing backslash
	package/sysdig/sysdig.mk:25: consecutive empty lines

Signed-off-by: Stephane Viau <stephane.viau@oss.nxp.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/sysdig/sysdig.mk | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/sysdig/sysdig.mk b/package/sysdig/sysdig.mk
index 9c8b818181..bcbb5ce01e 100644
--- a/package/sysdig/sysdig.mk
+++ b/package/sysdig/sysdig.mk
@@ -20,8 +20,7 @@ SYSDIG_DEPENDENCIES = \
 	luainterpreter \
 	ncurses \
 	openssl \
-	zlib \
-
+	zlib
 
 # sysdig creates the module Makefile from a template, which contains a
 # single place-holder, KBUILD_FLAGS, wich is only replaced with two
