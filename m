From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 24 Nov 2019 22:45:56 +0100
Subject: [Buildroot] [git commit branch/next] package/libgudev: bump version
 to 233
Message-ID: <20191124213953.F05AE81401@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a17db95253400a8be3cdf3efb3a581c0a3cf2dfa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Release notes:
http://ftp.gnome.org/pub/GNOME/sources/libgudev/233/libgudev-233.news

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libgudev/libgudev.hash | 4 ++--
 package/libgudev/libgudev.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libgudev/libgudev.hash b/package/libgudev/libgudev.hash
index 138ae93d71..bee394601e 100644
--- a/package/libgudev/libgudev.hash
+++ b/package/libgudev/libgudev.hash
@@ -1,5 +1,5 @@
-# From: http://ftp.gnome.org/pub/GNOME/sources/libgudev/232/libgudev-232.sha256sum
-sha256 ee4cb2b9c573cdf354f6ed744f01b111d4b5bed3503ffa956cefff50489c7860  libgudev-232.tar.xz
+# From http://ftp.gnome.org/pub/GNOME/sources/libgudev/233/libgudev-233.sha256sum
+sha256 587c4970eb23f4e2deee2cb1fb7838c94a78c578f41ce12cac0a3f4a80dabb03  libgudev-233.tar.xz
 
 # Hash for license file:
 sha256 dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/libgudev/libgudev.mk b/package/libgudev/libgudev.mk
index 50432c461e..63d592f9ac 100644
--- a/package/libgudev/libgudev.mk
+++ b/package/libgudev/libgudev.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBGUDEV_VERSION = 232
+LIBGUDEV_VERSION = 233
 LIBGUDEV_SOURCE = libgudev-$(LIBGUDEV_VERSION).tar.xz
 LIBGUDEV_SITE = http://ftp.gnome.org/pub/GNOME/sources/libgudev/$(LIBGUDEV_VERSION)
 LIBGUDEV_INSTALL_STAGING = YES
