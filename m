From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 29 Mar 2014 23:19:52 +0100
Subject: [Buildroot] [git commit] xapp_xlsfonts: Bump version to 1.0.4
Message-ID: <20140329222200.1D5C19C41F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=fd90662f26a7ddbd293d97c38861ae486e937183
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/x11r7/xapp_xlsfonts/xapp_xlsfonts.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/x11r7/xapp_xlsfonts/xapp_xlsfonts.mk b/package/x11r7/xapp_xlsfonts/xapp_xlsfonts.mk
index 619b7c5..f642d14 100644
--- a/package/x11r7/xapp_xlsfonts/xapp_xlsfonts.mk
+++ b/package/x11r7/xapp_xlsfonts/xapp_xlsfonts.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XAPP_XLSFONTS_VERSION = 1.0.1
+XAPP_XLSFONTS_VERSION = 1.0.4
 XAPP_XLSFONTS_SOURCE = xlsfonts-$(XAPP_XLSFONTS_VERSION).tar.bz2
 XAPP_XLSFONTS_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XLSFONTS_LICENSE = MIT
