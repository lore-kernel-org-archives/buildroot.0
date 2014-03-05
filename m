From: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Date: Wed,  5 Mar 2014 08:56:35 +0100
Subject: [Buildroot] [PATCH 1/1] package: normalize separator size to 80
Message-ID: <1394006195-32245-1-git-send-email-jerzy.grzegorek@trzebnica.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
---
 package/lbreakout2/lbreakout2.mk         |    4 ++--
 package/ltris/ltris.mk                   |    4 ++--
 package/luainterpreter/luainterpreter.mk |    4 ++--
 package/lunit/lunit.mk                   |    4 ++--
 package/lzlib/lzlib.mk                   |    4 ++--
 5 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/package/lbreakout2/lbreakout2.mk b/package/lbreakout2/lbreakout2.mk
index 48cbe4c..a246ba3 100644
--- a/package/lbreakout2/lbreakout2.mk
+++ b/package/lbreakout2/lbreakout2.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # lbreakout2
 #
-#############################################################
+################################################################################
 
 LBREAKOUT2_SITE = http://downloads.sourceforge.net/lgames/lbreakout2/2.6/
 LBREAKOUT2_VERSION = 2.6.4
diff --git a/package/ltris/ltris.mk b/package/ltris/ltris.mk
index 008f0d7..cc8a831 100644
--- a/package/ltris/ltris.mk
+++ b/package/ltris/ltris.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # ltris
 #
-#############################################################
+################################################################################
 
 LTRIS_SITE = http://downloads.sourceforge.net/lgames/ltris/
 LTRIS_VERSION = 1.0.19
diff --git a/package/luainterpreter/luainterpreter.mk b/package/luainterpreter/luainterpreter.mk
index 5443477..f9206e8 100644
--- a/package/luainterpreter/luainterpreter.mk
+++ b/package/luainterpreter/luainterpreter.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # luainterpreter
 #
-#############################################################
+################################################################################
 
 LUAINTERPRETER_SOURCE =
 LUAINTERPRETER_DEPENDENCIES = $(call qstrip,$(BR2_PACKAGE_PROVIDES_LUA_INTERPRETER))
diff --git a/package/lunit/lunit.mk b/package/lunit/lunit.mk
index 1b5f43c..15d94ab 100644
--- a/package/lunit/lunit.mk
+++ b/package/lunit/lunit.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # lunit
 #
-#############################################################
+################################################################################
 
 LUNIT_VERSION_UPSTREAM = 0.5
 LUNIT_VERSION = $(LUNIT_VERSION_UPSTREAM)-2
diff --git a/package/lzlib/lzlib.mk b/package/lzlib/lzlib.mk
index 24208ba..c96bea8 100644
--- a/package/lzlib/lzlib.mk
+++ b/package/lzlib/lzlib.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # lzlib
 #
-#############################################################
+################################################################################
 
 LZLIB_VERSION = 0.4.work3-1
 LZLIB_SUBDIR  = lzlib-0.4-work3
-- 
1.7.9.5
