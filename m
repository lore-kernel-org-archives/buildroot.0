From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 29 Mar 2014 23:19:16 +0100
Subject: [Buildroot] [git commit] xapp_appres: Bump version to 1.0.4
Message-ID: <20140329222159.6F1119C42C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a7e6a1cffe67cd6e5dd2796f9cffb110bca05e8a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/x11r7/xapp_appres/xapp_appres.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/x11r7/xapp_appres/xapp_appres.mk b/package/x11r7/xapp_appres/xapp_appres.mk
index c2f8d99..b84d742 100644
--- a/package/x11r7/xapp_appres/xapp_appres.mk
+++ b/package/x11r7/xapp_appres/xapp_appres.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XAPP_APPRES_VERSION = 1.0.1
+XAPP_APPRES_VERSION = 1.0.4
 XAPP_APPRES_SOURCE = appres-$(XAPP_APPRES_VERSION).tar.bz2
 XAPP_APPRES_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_APPRES_LICENSE = MIT
