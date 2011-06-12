From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 12 Jun 2011 21:59:59 +0200
Subject: [Buildroot] [git commit] Remove unused variable definitions
Message-ID: <20110612210711.37CC48733B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=97fafb9adc0fc8a3610fe28e8394accf96ad0a9c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 Makefile |   10 ----------
 1 files changed, 0 insertions(+), 10 deletions(-)

diff --git a/Makefile b/Makefile
index f3bdf3b..20dd707 100644
--- a/Makefile
+++ b/Makefile
@@ -223,16 +223,6 @@ HOST_LIBEXT:=.lib
 HOST_SHREXT:=.dll
 endif
 
-# The preferred type of libs we build for the target
-ifeq ($(BR2_PREFER_STATIC_LIB),y)
-LIBTGTEXT=.a
-#PREFERRED_LIB_FLAGS:=--disable-shared --enable-static
-else
-LIBTGTEXT=.so
-#PREFERRED_LIB_FLAGS:=--disable-static --enable-shared
-endif
-PREFERRED_LIB_FLAGS:=--enable-static --enable-shared
-
 ##############################################################
 #
 # The list of stuff to build for the target toolchain
-- 
1.7.3.4
