From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 23 Sep 2019 23:30:22 +0200
Subject: [Buildroot] [git commit] package/freeswitch: bump version to 1.10.1
Message-ID: <20190923213206.90AEB8F2C3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=814175208f15cb69187c3872702d2b610fef439c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
https://freeswitch.com/index.php/2019/08/20/freeswitch-v1-10-1-release/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/freeswitch/freeswitch.hash | 12 ++++++------
 package/freeswitch/freeswitch.mk   |  2 +-
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/freeswitch/freeswitch.hash b/package/freeswitch/freeswitch.hash
index 4014aa3c56..9811ca753c 100644
--- a/package/freeswitch/freeswitch.hash
+++ b/package/freeswitch/freeswitch.hash
@@ -1,9 +1,9 @@
-# From http://files.freeswitch.org/freeswitch-releases/freeswitch-1.10.0.tar.xz.md5
-md5 f874e0168bb3f2aa59be18818cc6d825 freeswitch-1.10.0.-release.tar.xz
-# From http://files.freeswitch.org/freeswitch-releases/freeswitch-1.10.0.tar.xz.sha1
-sha1 8c4f9582e50d84b03ef61e769014ac610aadd247 freeswitch-1.10.0.-release.tar.xz
-# From http://files.freeswitch.org/freeswitch-releases/freeswitch-1.10.0.tar.xz.sha256
-sha256 932992c6fed2ede1173cc6f25fe45017291afa1a8e1d97a9c5b65b44b6e67452 freeswitch-1.10.0.-release.tar.xz
+# From http://files.freeswitch.org/freeswitch-releases/freeswitch-1.10.1.tar.xz.md5
+md5 74c97835cace6309e552b017f8dfca81 freeswitch-1.10.1.-release.tar.xz
+# From http://files.freeswitch.org/freeswitch-releases/freeswitch-1.10.1.tar.xz.sha1
+sha1 6c6ce3dd3de1bce36043b9885cd8863ad3a466c0 freeswitch-1.10.1.-release.tar.xz
+# From http://files.freeswitch.org/freeswitch-releases/freeswitch-1.10.1.tar.xz.sha256
+sha256 360c867103c5f529a3724a46cf86da9b9acd8443b6793eb7f88fba0ace72001d freeswitch-1.10.1.-release.tar.xz
 # Locally computed
 sha256 75c933202f40939cdc3827fce20a1efdaa38291e2b5a65d234eb16e2cffda66a  COPYING
 sha256 c3e3388768dae8bf4edcc4108f95be815b8a05c0b0aef6e4c3d8df81affdfa34  docs/OPENH264_BINARY_LICENSE.txt
diff --git a/package/freeswitch/freeswitch.mk b/package/freeswitch/freeswitch.mk
index 030fd566e1..4736ef4531 100644
--- a/package/freeswitch/freeswitch.mk
+++ b/package/freeswitch/freeswitch.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FREESWITCH_VERSION = 1.10.0
+FREESWITCH_VERSION = 1.10.1
 FREESWITCH_SOURCE = freeswitch-$(FREESWITCH_VERSION).-release.tar.xz
 FREESWITCH_SITE = https://files.freeswitch.org/freeswitch-releases
 # External modules need headers/libs from staging
