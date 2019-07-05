From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 5 Jul 2019 08:23:41 +0200
Subject: [Buildroot] [git commit] package/freeswitch: bump version to 1.8.7
Message-ID: <20190705062454.9BBEF813A4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2120e8f2b8a1c44ff9ebb586302cc03ec1832ecf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Switched _SITE to https.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/freeswitch/freeswitch.hash | 12 ++++++------
 package/freeswitch/freeswitch.mk   |  4 ++--
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/package/freeswitch/freeswitch.hash b/package/freeswitch/freeswitch.hash
index d80934d436..e8fb81dd47 100644
--- a/package/freeswitch/freeswitch.hash
+++ b/package/freeswitch/freeswitch.hash
@@ -1,9 +1,9 @@
-# From http://files.freeswitch.org/freeswitch-releases/freeswitch-1.8.6.tar.xz.md5
-md5 cadec07057786cfb0bb805edc279d752 freeswitch-1.8.6.tar.xz
-# From http://files.freeswitch.org/freeswitch-releases/freeswitch-1.8.6.tar.xz.sha1
-sha1 c6eb7de942a61604774ca08ac8070244b7c3167a freeswitch-1.8.6.tar.xz
-# From http://files.freeswitch.org/freeswitch-releases/freeswitch-1.8.6.tar.xz.sha256
-sha256 b87f47e57d13de2b901bd1e4eb85491178e59a159a2831d7430abe7947f0d3a4 freeswitch-1.8.6.tar.xz
+# From http://files.freeswitch.org/freeswitch-releases/freeswitch-1.8.7.tar.xz.md5
+md5 40a065c9b597256b1636fa4b7470a73a freeswitch-1.8.7.tar.xz
+# From http://files.freeswitch.org/freeswitch-releases/freeswitch-1.8.7.tar.xz.sha1
+sha1 5ada2dbc365f368639f22375b41afe6f06bc2ffb freeswitch-1.8.7.tar.xz
+# From http://files.freeswitch.org/freeswitch-releases/freeswitch-1.8.7.tar.xz.sha256
+sha256 7d3cee32713db5f65e3d4703c6420038872d8f6efab8be4d58fbf66ffa993008 freeswitch-1.8.7.tar.xz
 # Locally computed
 sha256 75c933202f40939cdc3827fce20a1efdaa38291e2b5a65d234eb16e2cffda66a  COPYING
 sha256 c3e3388768dae8bf4edcc4108f95be815b8a05c0b0aef6e4c3d8df81affdfa34  docs/OPENH264_BINARY_LICENSE.txt
diff --git a/package/freeswitch/freeswitch.mk b/package/freeswitch/freeswitch.mk
index 1c49b8d814..d266d11863 100644
--- a/package/freeswitch/freeswitch.mk
+++ b/package/freeswitch/freeswitch.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-FREESWITCH_VERSION = 1.8.6
+FREESWITCH_VERSION = 1.8.7
 FREESWITCH_SOURCE = freeswitch-$(FREESWITCH_VERSION).tar.xz
-FREESWITCH_SITE = http://files.freeswitch.org/freeswitch-releases
+FREESWITCH_SITE = https://files.freeswitch.org/freeswitch-releases
 # External modules need headers/libs from staging
 FREESWITCH_INSTALL_STAGING = YES
 FREESWITCH_LICENSE = MPL-1.1, \
