From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 26 Jun 2014 23:07:36 +0200
Subject: [Buildroot] [git commit] freerdp: fix typo in license information
Message-ID: <20140627070642.5070E9D0D2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=be95d3a3ffe94a196219d210ccf452a14e83fa5c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/freerdp/freerdp.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/freerdp/freerdp.mk b/package/freerdp/freerdp.mk
index 90ede04..26688aa 100644
--- a/package/freerdp/freerdp.mk
+++ b/package/freerdp/freerdp.mk
@@ -9,7 +9,7 @@ FREERDP_SITE = $(call github,FreeRDP,FreeRDP,$(FREERDP_VERSION))
 FREERDP_DEPENDENCIES = openssl zlib \
 	xlib_libX11 xlib_libXt xlib_libXext xlib_libXcursor
 FREERDP_LICENSE = Apache-2.0
-FREEDRP_LICENSE_FILES = LICENSE
+FREERDP_LICENSE_FILES = LICENSE
 
 ifeq ($(BR2_PACKAGE_CUPS),y)
 FREERDP_CONF_OPT += -DWITH_CUPS=ON
