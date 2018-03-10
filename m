From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 10 Mar 2018 08:47:38 +0100
Subject: [Buildroot] [git commit] package/x11r7/xkeyboard-config: bump
 version to 2.23.1
Message-ID: <20180310074850.72F19800EB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b55f593c2a5746d275719d468674f9c8f1dc2727
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Added all upstream hashes and license hash.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/x11r7/xkeyboard-config/xkeyboard-config.hash | 11 +++++++----
 package/x11r7/xkeyboard-config/xkeyboard-config.mk   |  2 +-
 2 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/package/x11r7/xkeyboard-config/xkeyboard-config.hash b/package/x11r7/xkeyboard-config/xkeyboard-config.hash
index a0f781d881..56ea0e5251 100644
--- a/package/x11r7/xkeyboard-config/xkeyboard-config.hash
+++ b/package/x11r7/xkeyboard-config/xkeyboard-config.hash
@@ -1,4 +1,7 @@
-# From https://lists.x.org/archives/xorg-announce/2017-October/002811.html
-md5 eb61fb3fd419e817df572b0c8d94a883  xkeyboard-config-2.22.tar.bz2
-sha1 1e252098685afc3e802c98f3fd70d683654a13ab  xkeyboard-config-2.22.tar.bz2
-sha256 deaec9989fbc443358b43864437b7b6d39caff07890a4a8055105ce9fcaa59bd  xkeyboard-config-2.22.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2018-February/002833.html
+md5 875cbd09ab8394277fd16070326abbae  xkeyboard-config-2.23.1.tar.bz2
+sha1 184c9ce35f4fa44188acbf549f80d36407697ac3  xkeyboard-config-2.23.1.tar.bz2
+sha256 2a4bbc05fea22151b7a7c8ac2655d549aa9b0486bedc7f5a68c72716343b02f3  xkeyboard-config-2.23.1.tar.bz2
+sha512 d651bb89c265e58abe8bba4af6683364a8023cb73af7d00f401f33960e44fa94a7d8a8fdd2483d6703d1c261ca72ae5f2b53f543cfb70b2f571cfe9dcb80c3ba  xkeyboard-config-2.23.1.tar.bz2
+# Locally computed
+sha256 6ca90f4b67dced4062894d6d77f4cc39343df9e359fc12f5e5d3c89ef2a3ef6d  COPYING
diff --git a/package/x11r7/xkeyboard-config/xkeyboard-config.mk b/package/x11r7/xkeyboard-config/xkeyboard-config.mk
index ae88db785f..d9998aa489 100644
--- a/package/x11r7/xkeyboard-config/xkeyboard-config.mk
+++ b/package/x11r7/xkeyboard-config/xkeyboard-config.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XKEYBOARD_CONFIG_VERSION = 2.22
+XKEYBOARD_CONFIG_VERSION = 2.23.1
 XKEYBOARD_CONFIG_SOURCE = xkeyboard-config-$(XKEYBOARD_CONFIG_VERSION).tar.bz2
 XKEYBOARD_CONFIG_SITE = http://www.x.org/releases/individual/data/xkeyboard-config
 XKEYBOARD_CONFIG_LICENSE = MIT
