From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 11 Dec 2013 10:23:45 -0300
Subject: [Buildroot] [PATCH 12/16] freerdp: add licensing info
In-Reply-To: <1386768229-29485-1-git-send-email-gustavo@zacarias.com.ar>
References: <1386768229-29485-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1386768229-29485-12-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/freerdp/freerdp.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/freerdp/freerdp.mk b/package/freerdp/freerdp.mk
index c06aac9..3ac53aa 100644
--- a/package/freerdp/freerdp.mk
+++ b/package/freerdp/freerdp.mk
@@ -6,9 +6,10 @@
 
 FREERDP_VERSION = 1.0.1
 FREERDP_SITE = https://github.com/downloads/FreeRDP/FreeRDP
-
 FREERDP_DEPENDENCIES = openssl zlib \
 	xlib_libX11 xlib_libXt xlib_libXext xlib_libXcursor
+FREERDP_LICENSE = Apache 2.0
+FREEDRP_LICENSE_FILES = LICENSE
 
 ifeq ($(BR2_PACKAGE_CUPS),y)
 FREERDP_CONF_OPT += -DWITH_CUPS=ON
-- 
1.8.3.2
