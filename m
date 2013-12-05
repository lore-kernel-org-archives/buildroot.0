From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 6 Dec 2013 00:12:28 +0100
Subject: [Buildroot] [git commit] gpsd: update ubx option for version 3.10
Message-ID: <20131205231349.89EA59B92F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=24b7f4c81a8876d72bdc86ebb714b4c44d6ea8a8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For gpsd 3.10, the ubx scons option has been renamed to ublox. Update our
makefile accordingly.

Signed-off-by: Simon Dawson <spdawson@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gpsd/gpsd.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/gpsd/gpsd.mk b/package/gpsd/gpsd.mk
index 43c945a..261afde 100644
--- a/package/gpsd/gpsd.mk
+++ b/package/gpsd/gpsd.mk
@@ -147,7 +147,7 @@ ifneq ($(BR2_PACKAGE_GPSD_TRUE_NORTH),y)
 	GPSD_SCONS_OPTS += tnt=no
 endif
 ifneq ($(BR2_PACKAGE_GPSD_UBX),y)
-	GPSD_SCONS_OPTS += ubx=no
+	GPSD_SCONS_OPTS += ublox=no
 endif
 
 # Features
