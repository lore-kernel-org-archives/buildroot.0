From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 24 Mar 2018 21:55:42 +0100
Subject: [Buildroot] [git commit] package/x11r7/xapp_xlsclients: bump
 version to 1.1.4
Message-ID: <20180324210428.612407FF6A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ff2edf04c37a65f0c94e9505d886fe34b2dd2e77
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Added all upstream hashes, added license hash.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/x11r7/xapp_xlsclients/xapp_xlsclients.hash | 9 +++++++--
 package/x11r7/xapp_xlsclients/xapp_xlsclients.mk   | 2 +-
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/package/x11r7/xapp_xlsclients/xapp_xlsclients.hash b/package/x11r7/xapp_xlsclients/xapp_xlsclients.hash
index e1cb80b7fa..a465c3cee3 100644
--- a/package/x11r7/xapp_xlsclients/xapp_xlsclients.hash
+++ b/package/x11r7/xapp_xlsclients/xapp_xlsclients.hash
@@ -1,2 +1,7 @@
-# From http://lists.x.org/archives/xorg-announce/2013-September/002314.html
-sha256	5d9666fcc6c3de210fc70d5a841a404955af709a616fde530fe4e8f7723e3d3d	xlsclients-1.1.3.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2018-March/002866.html
+md5 4fa92377e0ddc137cd226a7a87b6b29a  xlsclients-1.1.4.tar.bz2
+sha1 175af1c216a1db3de5023ecd6cce186e7693c6e4  xlsclients-1.1.4.tar.bz2
+sha256 773f2af49c7ea2c44fba4213bee64325875c1b3c9bc4bbcd8dac9261751809c1  xlsclients-1.1.4.tar.bz2
+sha512 42fd848d88d3cf31168a37fed63f9f5b60ddc4f36be2956b354e574c93129d75f29e005d6631784380bcef27860b54c64f419ca18ad77f092f4520dec47b10f4  xlsclients-1.1.4.tar.bz2
+# Locally computed
+sha256 716d6f1d18cb97cdd4a2ef7b101d944a250ca9de57578a490c038b9aaf950648 COPYING
diff --git a/package/x11r7/xapp_xlsclients/xapp_xlsclients.mk b/package/x11r7/xapp_xlsclients/xapp_xlsclients.mk
index 798dce029c..167748b338 100644
--- a/package/x11r7/xapp_xlsclients/xapp_xlsclients.mk
+++ b/package/x11r7/xapp_xlsclients/xapp_xlsclients.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XAPP_XLSCLIENTS_VERSION = 1.1.3
+XAPP_XLSCLIENTS_VERSION = 1.1.4
 XAPP_XLSCLIENTS_SOURCE = xlsclients-$(XAPP_XLSCLIENTS_VERSION).tar.bz2
 XAPP_XLSCLIENTS_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XLSCLIENTS_LICENSE = MIT
