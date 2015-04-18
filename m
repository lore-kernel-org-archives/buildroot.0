From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 18 Apr 2015 18:30:04 +0200
Subject: [Buildroot] [git commit] package/x11r7/xapp_xlsfonts: bump version
	to 1.0.5, add hash
Message-ID: <20150418163305.D19657FCDF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=462118beab9bb83f52855fff3c24576ce1b3f263
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/x11r7/xapp_xlsfonts/xapp_xlsfonts.hash |    2 ++
 package/x11r7/xapp_xlsfonts/xapp_xlsfonts.mk   |    2 +-
 2 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/package/x11r7/xapp_xlsfonts/xapp_xlsfonts.hash b/package/x11r7/xapp_xlsfonts/xapp_xlsfonts.hash
new file mode 100644
index 0000000..f3a2603
--- /dev/null
+++ b/package/x11r7/xapp_xlsfonts/xapp_xlsfonts.hash
@@ -0,0 +1,2 @@
+# From http://lists.x.org/archives/xorg-announce/2015-April/002580.html
+sha256	40295bec35077cee93be2e4c26cc00268ed6ace779ae6e97766a866c1e3927fa	xlsfonts-1.0.5.tar.bz2
diff --git a/package/x11r7/xapp_xlsfonts/xapp_xlsfonts.mk b/package/x11r7/xapp_xlsfonts/xapp_xlsfonts.mk
index f642d14..1c42a61 100644
--- a/package/x11r7/xapp_xlsfonts/xapp_xlsfonts.mk
+++ b/package/x11r7/xapp_xlsfonts/xapp_xlsfonts.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XAPP_XLSFONTS_VERSION = 1.0.4
+XAPP_XLSFONTS_VERSION = 1.0.5
 XAPP_XLSFONTS_SOURCE = xlsfonts-$(XAPP_XLSFONTS_VERSION).tar.bz2
 XAPP_XLSFONTS_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XLSFONTS_LICENSE = MIT
