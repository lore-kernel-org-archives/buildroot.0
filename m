From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 29 Mar 2014 23:19:50 +0100
Subject: [Buildroot] [git commit] xapp_fslsfonts: Bump version to 1.0.4
Message-ID: <20140329222200.16CA59C41F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7db3f62072f7280849d57f7e7f796b27c00d489e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/x11r7/xapp_fslsfonts/xapp_fslsfonts.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/x11r7/xapp_fslsfonts/xapp_fslsfonts.mk b/package/x11r7/xapp_fslsfonts/xapp_fslsfonts.mk
index 14623c9..503b552 100644
--- a/package/x11r7/xapp_fslsfonts/xapp_fslsfonts.mk
+++ b/package/x11r7/xapp_fslsfonts/xapp_fslsfonts.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XAPP_FSLSFONTS_VERSION = 1.0.1
+XAPP_FSLSFONTS_VERSION = 1.0.4
 XAPP_FSLSFONTS_SOURCE = fslsfonts-$(XAPP_FSLSFONTS_VERSION).tar.bz2
 XAPP_FSLSFONTS_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_FSLSFONTS_LICENSE = MIT
