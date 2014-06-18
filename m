From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 18 Jun 2014 14:21:00 +0200
Subject: [Buildroot] [git commit] freerdp: bump to version 1.0.2
Message-ID: <20140618123420.6012C9D043@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0dafb509e545204235f774e4a71762c6772c2b68
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

And switch to github helper.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/freerdp/freerdp.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

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
