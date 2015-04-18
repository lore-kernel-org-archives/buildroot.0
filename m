From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 18 Apr 2015 18:40:17 +0200
Subject: [Buildroot] [git commit] package/x11r7/xapp_xinput: bump version to
	1.6.1, add hash
Message-ID: <20150418170659.6027A80E0E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=fbe9bf3c3904d839fa0622279a051c7e0f4005e6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/x11r7/xapp_xinput/xapp_xinput.hash |    2 ++
 package/x11r7/xapp_xinput/xapp_xinput.mk   |    2 +-
 2 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/package/x11r7/xapp_xinput/xapp_xinput.hash b/package/x11r7/xapp_xinput/xapp_xinput.hash
new file mode 100644
index 0000000..a8f6b70
--- /dev/null
+++ b/package/x11r7/xapp_xinput/xapp_xinput.hash
@@ -0,0 +1,2 @@
+# From http://lists.x.org/archives/xorg-announce/2013-September/002321.html
+sha256	b7632d0f228a8a6be93b09857ea413940fcf44091e60f4a0fe9f5fd82efd871f	xinput-1.6.1.tar.bz2
diff --git a/package/x11r7/xapp_xinput/xapp_xinput.mk b/package/x11r7/xapp_xinput/xapp_xinput.mk
index 790f2c0..099408b 100644
--- a/package/x11r7/xapp_xinput/xapp_xinput.mk
+++ b/package/x11r7/xapp_xinput/xapp_xinput.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XAPP_XINPUT_VERSION = 1.6.0
+XAPP_XINPUT_VERSION = 1.6.1
 XAPP_XINPUT_SOURCE = xinput-$(XAPP_XINPUT_VERSION).tar.bz2
 XAPP_XINPUT_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XINPUT_LICENSE = MIT
