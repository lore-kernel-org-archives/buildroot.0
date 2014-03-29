From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 29 Mar 2014 23:19:18 +0100
Subject: [Buildroot] [git commit] xapp_sessreg: Bump version to 1.0.8
Message-ID: <20140329222159.7AC879C42C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=36bcfb849080669f4d9dd46e5368da9d2b8eb0cf
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/x11r7/xapp_sessreg/xapp_sessreg.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/x11r7/xapp_sessreg/xapp_sessreg.mk b/package/x11r7/xapp_sessreg/xapp_sessreg.mk
index ba2a07b..1b27a7b 100644
--- a/package/x11r7/xapp_sessreg/xapp_sessreg.mk
+++ b/package/x11r7/xapp_sessreg/xapp_sessreg.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XAPP_SESSREG_VERSION = 1.0.7
+XAPP_SESSREG_VERSION = 1.0.8
 XAPP_SESSREG_SOURCE = sessreg-$(XAPP_SESSREG_VERSION).tar.bz2
 XAPP_SESSREG_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_SESSREG_LICENSE = MIT
