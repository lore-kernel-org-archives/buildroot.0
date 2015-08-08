From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 08 Aug 2015 10:57:06 -0000
Subject: [Buildroot] [git commit branch/next]
	package/x11r7/xkeyboard-config: bump version to 2.15
Message-ID: <20150808105636.994827FB5A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=81e4955f5b5769d94d699af1dba1b5b1bd16556d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../x11r7/xkeyboard-config/xkeyboard-config.hash   |    4 ++--
 package/x11r7/xkeyboard-config/xkeyboard-config.mk |    2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/x11r7/xkeyboard-config/xkeyboard-config.hash b/package/x11r7/xkeyboard-config/xkeyboard-config.hash
index 68213a6..c9bdca2 100644
--- a/package/x11r7/xkeyboard-config/xkeyboard-config.hash
+++ b/package/x11r7/xkeyboard-config/xkeyboard-config.hash
@@ -1,2 +1,2 @@
-# From http://lists.x.org/archives/xorg-announce/2015-January/002527.html
-sha256	dc91458a214c56a35727f9e523fc647615de64137057ca6ee4d4d4474a4bb2ae	xkeyboard-config-2.14.tar.bz2
+# From http://lists.x.org/archives/xorg-announce/2015-May/002609.html
+sha256	0e443cf7ca2f0b40846472c029647a05933fc705d611e1478c4db8a48a6f38bf	xkeyboard-config-2.15.tar.bz2
diff --git a/package/x11r7/xkeyboard-config/xkeyboard-config.mk b/package/x11r7/xkeyboard-config/xkeyboard-config.mk
index 96a769e..f88686b 100644
--- a/package/x11r7/xkeyboard-config/xkeyboard-config.mk
+++ b/package/x11r7/xkeyboard-config/xkeyboard-config.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XKEYBOARD_CONFIG_VERSION = 2.14
+XKEYBOARD_CONFIG_VERSION = 2.15
 XKEYBOARD_CONFIG_SOURCE = xkeyboard-config-$(XKEYBOARD_CONFIG_VERSION).tar.bz2
 XKEYBOARD_CONFIG_SITE = http://www.x.org/releases/individual/data/xkeyboard-config
 XKEYBOARD_CONFIG_LICENSE = MIT
