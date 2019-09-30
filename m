From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 30 Sep 2019 22:53:26 +0200
Subject: [Buildroot] [git commit] package/s6: bump version to 2.9.0.0
Message-ID: <20190930204831.6888B83CCF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4082571c60aff57b4aaedd30765ad985cadba49f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The hash of the COPYING file is updated to take into account the
copyright year update:

-Copyright (c) 2011-2018 Laurent Bercot <ska-skaware@skarnet.org>
+Copyright (c) 2011-2019 Laurent Bercot <ska-skaware@skarnet.org>

Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/s6/s6.hash | 4 ++--
 package/s6/s6.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/s6/s6.hash b/package/s6/s6.hash
index 12791a9760..8949206564 100644
--- a/package/s6/s6.hash
+++ b/package/s6/s6.hash
@@ -1,3 +1,3 @@
 # Locally generated
-sha256 f37547f2890eb50bcb4cd46ffa38bad5ec9e6fd6bc7b73a8df0bdf0cf11f01a9  s6-2.7.1.1.tar.gz
-sha256 3eadcf980c40da0f257b8292d805ff41e5e5a908c1942315d9a627732e1aa012  COPYING
+sha256 1cac59bf9ff7c011b189ae2def3c76b147c2c431b0a901029fcaf957a6d9a343  s6-2.9.0.0.tar.gz
+sha256 d8e17a6418d26867c13801810903a1f78beac8cfe8f92c2a85afe59f3c3fc48c  COPYING
diff --git a/package/s6/s6.mk b/package/s6/s6.mk
index 83945b08d5..17a1342432 100644
--- a/package/s6/s6.mk
+++ b/package/s6/s6.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-S6_VERSION = 2.7.1.1
+S6_VERSION = 2.9.0.0
 S6_SITE = http://skarnet.org/software/s6
 S6_LICENSE = ISC
 S6_LICENSE_FILES = COPYING
