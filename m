From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 18 Apr 2015 18:40:17 +0200
Subject: [Buildroot] [git commit] package/x11r7/xapp_fonttosfnt: bump
	version to 1.0.4, add hash
Message-ID: <20150418170659.98F3A80E0E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=754fa759c6d8fcb8d2979b3e858a13c0c9ec56dd
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/x11r7/xapp_fonttosfnt/xapp_fonttosfnt.hash |    2 ++
 package/x11r7/xapp_fonttosfnt/xapp_fonttosfnt.mk   |    2 +-
 2 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/package/x11r7/xapp_fonttosfnt/xapp_fonttosfnt.hash b/package/x11r7/xapp_fonttosfnt/xapp_fonttosfnt.hash
new file mode 100644
index 0000000..e76c5c8
--- /dev/null
+++ b/package/x11r7/xapp_fonttosfnt/xapp_fonttosfnt.hash
@@ -0,0 +1,2 @@
+# From http://lists.x.org/archives/xorg-announce/2008-May/000543.html
+sha1	a609fba513947e5267c924f85774c0e44a076a7d	fonttosfnt-1.0.4.tar.bz2
diff --git a/package/x11r7/xapp_fonttosfnt/xapp_fonttosfnt.mk b/package/x11r7/xapp_fonttosfnt/xapp_fonttosfnt.mk
index f935e54..1571a3b 100644
--- a/package/x11r7/xapp_fonttosfnt/xapp_fonttosfnt.mk
+++ b/package/x11r7/xapp_fonttosfnt/xapp_fonttosfnt.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XAPP_FONTTOSFNT_VERSION = 1.0.3
+XAPP_FONTTOSFNT_VERSION = 1.0.4
 XAPP_FONTTOSFNT_SOURCE = fonttosfnt-$(XAPP_FONTTOSFNT_VERSION).tar.bz2
 XAPP_FONTTOSFNT_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_FONTTOSFNT_LICENSE = MIT
