From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 29 Mar 2014 23:19:34 +0100
Subject: [Buildroot] [git commit] xapp_ico: Bump version to 1.0.4
Message-ID: <20140329222159.BD76F9C41F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0de525e713b65f6ce1dc8b3e659919129e77be15
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/x11r7/xapp_ico/xapp_ico.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/x11r7/xapp_ico/xapp_ico.mk b/package/x11r7/xapp_ico/xapp_ico.mk
index aecd95a..621d1e4 100644
--- a/package/x11r7/xapp_ico/xapp_ico.mk
+++ b/package/x11r7/xapp_ico/xapp_ico.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XAPP_ICO_VERSION = 1.0.2
+XAPP_ICO_VERSION = 1.0.4
 XAPP_ICO_SOURCE = ico-$(XAPP_ICO_VERSION).tar.bz2
 XAPP_ICO_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_ICO_LICENSE = MIT
