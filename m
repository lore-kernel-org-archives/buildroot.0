From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 30 Sep 2019 22:53:26 +0200
Subject: [Buildroot] [git commit] package/s6-rc: bump version to 0.5.1.0
Message-ID: <20190930204831.70CC983CCF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=500b2f1b9c5df3de283d0cb1c64b3b709e57ce23
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The hash of the COPYING file is updated due to the following copyright
year change:

-Copyright (c) 2015-2018 Laurent Bercot <ska-skaware@skarnet.org>
+Copyright (c) 2015-2019 Laurent Bercot <ska-skaware@skarnet.org>

Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/s6-rc/s6-rc.hash | 4 ++--
 package/s6-rc/s6-rc.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/s6-rc/s6-rc.hash b/package/s6-rc/s6-rc.hash
index e8bb7ae36a..e7296dfb2f 100644
--- a/package/s6-rc/s6-rc.hash
+++ b/package/s6-rc/s6-rc.hash
@@ -1,3 +1,3 @@
 # Locally generated
-sha256 4b4b6205e31e85be583a165a994552d0f30ebcdabbdd919f9f469815d7679e5c  s6-rc-0.4.0.1.tar.gz
-sha256 1377d3b18a31de11e8bb06f0f46888a23bc16cbc57285035793bf7e7943bbcb3  COPYING
+sha256 93c02d0b505c036c332e13769154d82c9e31e4dd99f3ba80aa97d377ca9ac11c  s6-rc-0.5.1.0.tar.gz
+sha256 487e89990a571700bcdf7c0cbbde2859446f79e85e8b59791adab98fff6b1889  COPYING
diff --git a/package/s6-rc/s6-rc.mk b/package/s6-rc/s6-rc.mk
index 222ba139c6..d0b5da4283 100644
--- a/package/s6-rc/s6-rc.mk
+++ b/package/s6-rc/s6-rc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-S6_RC_VERSION = 0.4.0.1
+S6_RC_VERSION = 0.5.1.0
 S6_RC_SITE = http://skarnet.org/software/s6-rc
 S6_RC_LICENSE = ISC
 S6_RC_LICENSE_FILES = COPYING
