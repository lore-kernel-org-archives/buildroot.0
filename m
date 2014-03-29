From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 29 Mar 2014 23:19:27 +0100
Subject: [Buildroot] [git commit] xapp_xkbutils: Bump version to 1.0.4
Message-ID: <20140329222159.9EE9F9C41F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d8ac87d265829469624c6e80a4f9c9093c31ac1b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/x11r7/xapp_xkbutils/xapp_xkbutils.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/x11r7/xapp_xkbutils/xapp_xkbutils.mk b/package/x11r7/xapp_xkbutils/xapp_xkbutils.mk
index eaabea5..96ca8a4 100644
--- a/package/x11r7/xapp_xkbutils/xapp_xkbutils.mk
+++ b/package/x11r7/xapp_xkbutils/xapp_xkbutils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XAPP_XKBUTILS_VERSION = 1.0.3
+XAPP_XKBUTILS_VERSION = 1.0.4
 XAPP_XKBUTILS_SOURCE = xkbutils-$(XAPP_XKBUTILS_VERSION).tar.bz2
 XAPP_XKBUTILS_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XKBUTILS_LICENSE = MIT
