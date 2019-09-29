From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Sun, 29 Sep 2019 19:10:15 +0200
Subject: [Buildroot] [PATCH 08/10] package/s6-rc: bump version to 0.5.1.0
In-Reply-To: <20190929171017.26831-1-eric.le.bihan.dev@free.fr>
References: <20190929171017.26831-1-eric.le.bihan.dev@free.fr>
Message-ID: <20190929171017.26831-9-eric.le.bihan.dev@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
---
 package/s6-rc/s6-rc.hash | 2 +-
 package/s6-rc/s6-rc.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/s6-rc/s6-rc.hash b/package/s6-rc/s6-rc.hash
index e8bb7ae36a..1eaa9fd4b6 100644
--- a/package/s6-rc/s6-rc.hash
+++ b/package/s6-rc/s6-rc.hash
@@ -1,3 +1,3 @@
 # Locally generated
-sha256 4b4b6205e31e85be583a165a994552d0f30ebcdabbdd919f9f469815d7679e5c  s6-rc-0.4.0.1.tar.gz
+sha256 93c02d0b505c036c332e13769154d82c9e31e4dd99f3ba80aa97d377ca9ac11c  s6-rc-0.5.1.0.tar.gz
 sha256 1377d3b18a31de11e8bb06f0f46888a23bc16cbc57285035793bf7e7943bbcb3  COPYING
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
-- 
2.21.0
