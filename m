From: Stephane Viau <stephane.viau@oss.nxp.com>
Date: Mon,  3 Aug 2020 09:31:14 +0200
Subject: [Buildroot] [PATCH 1/1] package/sysdig: Fix check-package
Message-ID: <1596439874-24550-1-git-send-email-stephane.viau@oss.nxp.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch fixes a couple of 'check-package' errors:

	package/sysdig/sysdig.mk:23: remove trailing backslash
	package/sysdig/sysdig.mk:25: consecutive empty lines

Signed-off-by: Stephane Viau <stephane.viau@oss.nxp.com>
---
 package/sysdig/sysdig.mk | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/sysdig/sysdig.mk b/package/sysdig/sysdig.mk
index 9c8b818..bcbb5ce 100644
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
-- 
2.7.4
