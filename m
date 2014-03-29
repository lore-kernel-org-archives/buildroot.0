From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 29 Mar 2014 23:19:13 +0100
Subject: [Buildroot] [git commit] xapp_xrefresh: Bump version to 1.0.5
Message-ID: <20140329222159.62ADA9C42C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=fd0640097a67584b00abf261373e21f122e11145
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/x11r7/xapp_xrefresh/xapp_xrefresh.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/x11r7/xapp_xrefresh/xapp_xrefresh.mk b/package/x11r7/xapp_xrefresh/xapp_xrefresh.mk
index 5578e46..8403762 100644
--- a/package/x11r7/xapp_xrefresh/xapp_xrefresh.mk
+++ b/package/x11r7/xapp_xrefresh/xapp_xrefresh.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XAPP_XREFRESH_VERSION = 1.0.4
+XAPP_XREFRESH_VERSION = 1.0.5
 XAPP_XREFRESH_SOURCE = xrefresh-$(XAPP_XREFRESH_VERSION).tar.bz2
 XAPP_XREFRESH_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XREFRESH_LICENSE = MIT
