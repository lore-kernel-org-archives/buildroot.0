From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 01 Dec 2015 23:21:19 -0000
Subject: [Buildroot] [git commit] package/x11r7/xapp_xinput: bump version to
	1.6.2
Message-ID: <20151201232117.100E47F9FA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=daf9b1524d6a55a1205bce8183d4dbe5c53426bd
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/x11r7/xapp_xinput/xapp_xinput.hash | 4 ++--
 package/x11r7/xapp_xinput/xapp_xinput.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/x11r7/xapp_xinput/xapp_xinput.hash b/package/x11r7/xapp_xinput/xapp_xinput.hash
index a8f6b70..724b2e2 100644
--- a/package/x11r7/xapp_xinput/xapp_xinput.hash
+++ b/package/x11r7/xapp_xinput/xapp_xinput.hash
@@ -1,2 +1,2 @@
-# From http://lists.x.org/archives/xorg-announce/2013-September/002321.html
-sha256	b7632d0f228a8a6be93b09857ea413940fcf44091e60f4a0fe9f5fd82efd871f	xinput-1.6.1.tar.bz2
+# From http://lists.x.org/archives/xorg-announce/2015-October/002643.html
+sha256	3694d29b4180952fbf13c6d4e59541310cbb11eef5bf888ff3d8b7f4e3aee5c4		xinput-1.6.2.tar.bz2
diff --git a/package/x11r7/xapp_xinput/xapp_xinput.mk b/package/x11r7/xapp_xinput/xapp_xinput.mk
index 099408b..aaa7a80 100644
--- a/package/x11r7/xapp_xinput/xapp_xinput.mk
+++ b/package/x11r7/xapp_xinput/xapp_xinput.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XAPP_XINPUT_VERSION = 1.6.1
+XAPP_XINPUT_VERSION = 1.6.2
 XAPP_XINPUT_SOURCE = xinput-$(XAPP_XINPUT_VERSION).tar.bz2
 XAPP_XINPUT_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XINPUT_LICENSE = MIT
