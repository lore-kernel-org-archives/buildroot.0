From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 11 Dec 2013 22:25:59 +0100
Subject: [Buildroot] [git commit] freerdp: add licensing info
Message-ID: <20131211213615.6BB149BFD0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=632fd88385a0e43ce2f8b8985916fbaee8c6cfbe
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/freerdp/freerdp.mk |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

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
