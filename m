From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 11 Dec 2010 02:40:53 +0100
Subject: [Buildroot] [git commit master 1/1] libconfig: bump version
Message-ID: <20101211014135.EBD738E25C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=6f955df42d27f9afe7a9a1a43d0a4095a95c1286
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: Don't disable libtool patch]
Signed-off-by: Sagaert Johan <sagaert.johan@skynet.be>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                        |    4 ++--
 package/libconfig/libconfig.mk |    2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/CHANGES b/CHANGES
index c1c4a6f..399dba2 100644
--- a/CHANGES
+++ b/CHANGES
@@ -3,8 +3,8 @@
 	Ccache support reworked. Now used for both host and target
 	compilation, and cache is stored in ~/.buildroot-ccache.
 
-	Updated/fixed packages: busybox, cloop, m4, openssh, openssl,
-	qt, usbutils, xz
+	Updated/fixed packages: busybox, cloop, libconfig, m4,
+	openssh, openssl, qt, usbutils, xz
 
 	New packages: dhrystone, lsuio, rsh-redone, whetstone
 
diff --git a/package/libconfig/libconfig.mk b/package/libconfig/libconfig.mk
index d260930..6e232a4 100644
--- a/package/libconfig/libconfig.mk
+++ b/package/libconfig/libconfig.mk
@@ -3,7 +3,7 @@
 # libconfig
 #
 #############################################################
-LIBCONFIG_VERSION:=1.3
+LIBCONFIG_VERSION:=1.4.6
 LIBCONFIG_SOURCE:=libconfig-$(LIBCONFIG_VERSION).tar.gz
 LIBCONFIG_SITE:=http://www.hyperrealm.com/libconfig/
 LIBCONFIG_AUTORECONF:=NO
-- 
1.7.2.2
