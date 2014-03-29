From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 29 Mar 2014 23:19:45 +0100
Subject: [Buildroot] [git commit] xapp_viewres: Bump version to 1.0.4
Message-ID: <20140329222159.F378F9C41F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=bbd9575c23ab41f5e7bc4a168a69dfc60cf155b3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/x11r7/xapp_viewres/xapp_viewres.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/x11r7/xapp_viewres/xapp_viewres.mk b/package/x11r7/xapp_viewres/xapp_viewres.mk
index 6a7fe51..3e1fd8d 100644
--- a/package/x11r7/xapp_viewres/xapp_viewres.mk
+++ b/package/x11r7/xapp_viewres/xapp_viewres.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XAPP_VIEWRES_VERSION = 1.0.3
+XAPP_VIEWRES_VERSION = 1.0.4
 XAPP_VIEWRES_SOURCE = viewres-$(XAPP_VIEWRES_VERSION).tar.bz2
 XAPP_VIEWRES_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_VIEWRES_LICENSE = MIT
