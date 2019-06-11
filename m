From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Tue, 11 Jun 2019 07:16:54 +0200
Subject: [Buildroot] [PATCH v2 1/2] package/freeswitch: bump version to 1.8.6
Message-ID: <20190611051655.31679-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Updated license hash after upstream commit
https://freeswitch.org/stash/projects/FS/repos/freeswitch/commits/a1f3b4862e7fd44a37862ae84c0e79f89c9bc0d8

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
v2: no changes

 package/freeswitch/freeswitch.hash | 14 +++++++-------
 package/freeswitch/freeswitch.mk   |  2 +-
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/package/freeswitch/freeswitch.hash b/package/freeswitch/freeswitch.hash
index 6f90c21564..1c5de7bcc5 100644
--- a/package/freeswitch/freeswitch.hash
+++ b/package/freeswitch/freeswitch.hash
@@ -1,11 +1,11 @@
-# From http://files.freeswitch.org/freeswitch-releases/freeswitch-1.8.5.tar.xz.md5
-md5 e3d750ed0bbf13ce6fe228af9af07bcd freeswitch-1.8.5.tar.xz
-# From http://files.freeswitch.org/freeswitch-releases/freeswitch-1.8.5.tar.xz.sha1
-sha1 e9f95b42ed9dd41437a65bddbb5c1f647436e426 freeswitch-1.8.5.tar.xz
-# From http://files.freeswitch.org/freeswitch-releases/freeswitch-1.8.5.tar.xz.sha256
-sha256 503a551be5d6df06162ea9d98a952b6fb524852ce2352fe3ca3a36a76995b046 freeswitch-1.8.5.tar.xz
+# From http://files.freeswitch.org/freeswitch-releases/freeswitch-1.8.6.tar.xz.md5
+md5 cadec07057786cfb0bb805edc279d752 freeswitch-1.8.6.tar.xz
+# From http://files.freeswitch.org/freeswitch-releases/freeswitch-1.8.6.tar.xz.sha1
+sha1 c6eb7de942a61604774ca08ac8070244b7c3167a freeswitch-1.8.6.tar.xz
+# From http://files.freeswitch.org/freeswitch-releases/freeswitch-1.8.6.tar.xz.sha256
+sha256 b87f47e57d13de2b901bd1e4eb85491178e59a159a2831d7430abe7947f0d3a4 freeswitch-1.8.6.tar.xz
 # Locally computed
-sha256 10299420c1e8602c0daf5a59d022621cd72a9148d1f0f33501edb3db3445c7fe  COPYING
+sha256 75c933202f40939cdc3827fce20a1efdaa38291e2b5a65d234eb16e2cffda66a  COPYING
 sha256 e8e26b16da14aa3e6ed5c22c705fdc1f45d6225fca461ea9f7314bcdfdc414c4  libs/apr/LICENSE
 sha256 1eefb2ea1db0af7729a9d8a27d7c65d8a37ab185393f935b029aac6828ce315a  libs/apr-util/LICENSE
 sha256 8267348d5af1262c11d1a08de2f5afc77457755f1ac658627dd9acf71011d615  libs/libvpx/LICENSE
diff --git a/package/freeswitch/freeswitch.mk b/package/freeswitch/freeswitch.mk
index 0b7544d097..8c0c7fb118 100644
--- a/package/freeswitch/freeswitch.mk
+++ b/package/freeswitch/freeswitch.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FREESWITCH_VERSION = 1.8.5
+FREESWITCH_VERSION = 1.8.6
 FREESWITCH_SOURCE = freeswitch-$(FREESWITCH_VERSION).tar.xz
 FREESWITCH_SITE = http://files.freeswitch.org/freeswitch-releases
 # External modules need headers/libs from staging
-- 
2.20.1
