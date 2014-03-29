From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 29 Mar 2014 23:19:30 +0100
Subject: [Buildroot] [git commit] xapp_xev: Bump version to 1.2.1
Message-ID: <20140329222159.AB5779C41F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=27fe69b4994f525debd1240c5a6ce3f84394a3f2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/x11r7/xapp_xev/xapp_xev.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/x11r7/xapp_xev/xapp_xev.mk b/package/x11r7/xapp_xev/xapp_xev.mk
index f98868c..f8460a7 100644
--- a/package/x11r7/xapp_xev/xapp_xev.mk
+++ b/package/x11r7/xapp_xev/xapp_xev.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XAPP_XEV_VERSION = 1.2.0
+XAPP_XEV_VERSION = 1.2.1
 XAPP_XEV_SOURCE = xev-$(XAPP_XEV_VERSION).tar.bz2
 XAPP_XEV_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XEV_LICENSE = MIT
