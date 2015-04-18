From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 18 Apr 2015 18:40:17 +0200
Subject: [Buildroot] [git commit] package/x11r7/xapp_xeyes: bump version to
	1.1.1, add hash
Message-ID: <20150418170659.42FEA7F922@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6877eeb0de2ce00764bc9115344e9e074e6366ea
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/x11r7/xapp_xeyes/xapp_xeyes.hash |    2 ++
 package/x11r7/xapp_xeyes/xapp_xeyes.mk   |    2 +-
 2 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/package/x11r7/xapp_xeyes/xapp_xeyes.hash b/package/x11r7/xapp_xeyes/xapp_xeyes.hash
new file mode 100644
index 0000000..02eb26b
--- /dev/null
+++ b/package/x11r7/xapp_xeyes/xapp_xeyes.hash
@@ -0,0 +1,2 @@
+# From http://lists.x.org/archives/xorg-announce/2010-November/001552.html
+sha1	efe6116d31a7f69e4fb6038613e52b0960b9b61c	xeyes-1.1.1.tar.bz2
diff --git a/package/x11r7/xapp_xeyes/xapp_xeyes.mk b/package/x11r7/xapp_xeyes/xapp_xeyes.mk
index 2bed751..89cac51 100644
--- a/package/x11r7/xapp_xeyes/xapp_xeyes.mk
+++ b/package/x11r7/xapp_xeyes/xapp_xeyes.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XAPP_XEYES_VERSION = 1.0.1
+XAPP_XEYES_VERSION = 1.1.1
 XAPP_XEYES_SOURCE = xeyes-$(XAPP_XEYES_VERSION).tar.bz2
 XAPP_XEYES_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XEYES_LICENSE = MIT
