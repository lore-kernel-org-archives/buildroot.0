From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 29 Aug 2010 21:51:07 +0200
Subject: [Buildroot] [git commit master 1/1] startup-notification: fix typo
	in dependencies line
Message-ID: <20100829195129.7EF7E8A2D8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=96c607c93a7a532d5a80329e2838fe131c1f2461
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                                            |    3 ++-
 .../startup-notification/startup-notification.mk   |    2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/CHANGES b/CHANGES
index c18edab..0b24e51 100644
--- a/CHANGES
+++ b/CHANGES
@@ -18,7 +18,8 @@
 	fs: old-style squashfs for big endian archs fixed.
 
 	Updated/fixed packages: busybox, imagemagick, libglib2, lua,
-	luafilesystem, lzo, netcat, php, qt, sysvinit, util-linux
+	luafilesystem, lzo, netcat, php, qt, startup-notification,
+	sysvinit, util-linux
 
 	Issues resolved (http://bugs.uclibc.org):
 
diff --git a/package/startup-notification/startup-notification.mk b/package/startup-notification/startup-notification.mk
index f70fcc1..ec4a895 100644
--- a/package/startup-notification/startup-notification.mk
+++ b/package/startup-notification/startup-notification.mk
@@ -9,7 +9,7 @@ STARTUP_NOTIFICATION_SITE = http://freedesktop.org/software/startup-notification
 STARTUP_NOTIFICATION_AUTORECONF = NO
 STARTUP_NOTIFICATION_INSTALL_STAGING = YES
 STARTUP_NOTIFICATION_INSTALL_TARGET = YES
-STARTUP_NOTIFICATION = xlib_libX11
+STARTUP_NOTIFICATION_DEPENDENCIES = xlib_libX11
 
 STARTUP_NOTIFICATION_CONF_ENV = lf_cv_sane_realloc=yes
 
-- 
1.7.1
