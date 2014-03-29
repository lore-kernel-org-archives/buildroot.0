From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 29 Mar 2014 23:19:21 +0100
Subject: [Buildroot] [git commit] xapp_rstart: Bump version to 1.0.5
Message-ID: <20140329222159.874849C41F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d7f03f4bf2fba01ab906f090651fce9ff4ea3dba
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/x11r7/xapp_rstart/xapp_rstart.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/x11r7/xapp_rstart/xapp_rstart.mk b/package/x11r7/xapp_rstart/xapp_rstart.mk
index aa6a4b3..2bcc292 100644
--- a/package/x11r7/xapp_rstart/xapp_rstart.mk
+++ b/package/x11r7/xapp_rstart/xapp_rstart.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XAPP_RSTART_VERSION = 1.0.2
+XAPP_RSTART_VERSION = 1.0.5
 XAPP_RSTART_SOURCE = rstart-$(XAPP_RSTART_VERSION).tar.bz2
 XAPP_RSTART_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_RSTART_LICENSE = MIT
