From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 13 Nov 2018 23:57:08 +0100
Subject: [Buildroot] [git commit branch/2018.08.x] gpsd: disable
 documentation
Message-ID: <20181113225433.7192082BD3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=43b5fa2f73fc424cfb28a2f444e492ee59e63c27
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.08.x

Fixes:
 - http://autobuild.buildroot.org/results/cbdb4cc34080714082f044fde7e069e6ab5a0e8e

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit c0deed8eed0a4e4cd0380b7bcaa54d0056f6df46)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gpsd/gpsd.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/gpsd/gpsd.mk b/package/gpsd/gpsd.mk
index 8c8023e818..e734d222af 100644
--- a/package/gpsd/gpsd.mk
+++ b/package/gpsd/gpsd.mk
@@ -19,6 +19,7 @@ GPSD_SCONS_ENV = $(TARGET_CONFIGURE_OPTS)
 
 GPSD_SCONS_OPTS = \
 	arch=$(ARCH)\
+	manbuild=no \
 	prefix=/usr\
 	sysroot=$(STAGING_DIR)\
 	strip=no\
