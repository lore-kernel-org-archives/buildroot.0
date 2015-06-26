From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 26 Jun 2015 09:38:21 +0200
Subject: [Buildroot] [git commit] libconfig: bump to 1.5
Message-ID: <20150626075003.3AA128185A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5a89f1c759dbad494a6abf921970b879eabae8d9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add hash file.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Tested-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libconfig/libconfig.hash |    2 ++
 package/libconfig/libconfig.mk   |    2 +-
 2 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/package/libconfig/libconfig.hash b/package/libconfig/libconfig.hash
new file mode 100644
index 0000000..30110cb
--- /dev/null
+++ b/package/libconfig/libconfig.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256  e31daa390d8e4461c8830512fe2e13ba1a3d6a02a2305a02429eec61e68703f6  libconfig-1.5.tar.gz
diff --git a/package/libconfig/libconfig.mk b/package/libconfig/libconfig.mk
index a70ff94..f11937c 100644
--- a/package/libconfig/libconfig.mk
+++ b/package/libconfig/libconfig.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBCONFIG_VERSION = 1.4.9
+LIBCONFIG_VERSION = 1.5
 LIBCONFIG_SITE = http://www.hyperrealm.com/libconfig
 LIBCONFIG_LICENSE = LGPLv2.1+
 LIBCONFIG_LICENSE_FILES = COPYING.LIB
