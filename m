From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 16 Jun 2014 19:54:56 -0300
Subject: [Buildroot] [PATCH] freerdp: bump to version 1.0.2
Message-ID: <1402959296-15423-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

And switch to github helper.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/freerdp/freerdp.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/freerdp/freerdp.mk b/package/freerdp/freerdp.mk
index e92067c..90ede04 100644
--- a/package/freerdp/freerdp.mk
+++ b/package/freerdp/freerdp.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-FREERDP_VERSION = 1.0.1
-FREERDP_SITE = https://github.com/downloads/FreeRDP/FreeRDP
+FREERDP_VERSION = 1.0.2
+FREERDP_SITE = $(call github,FreeRDP,FreeRDP,$(FREERDP_VERSION))
 FREERDP_DEPENDENCIES = openssl zlib \
 	xlib_libX11 xlib_libXt xlib_libXext xlib_libXcursor
 FREERDP_LICENSE = Apache-2.0
-- 
1.8.5.5
