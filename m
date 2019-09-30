From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 30 Sep 2019 22:53:26 +0200
Subject: [Buildroot] [git commit] package/s6-linux-init: bump version to
 1.0.3.0
Message-ID: <20190930204831.7A0AA83CCF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d855a2f976eda81c999e9bf161171db6d30376ca
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The COPYING hash changes due to the following copyright year update:

-Copyright (c) 2015-2018 Laurent Bercot <ska-skaware@skarnet.org>
+Copyright (c) 2015-2019 Laurent Bercot <ska-skaware@skarnet.org>

Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/s6-linux-init/s6-linux-init.hash | 4 ++--
 package/s6-linux-init/s6-linux-init.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/s6-linux-init/s6-linux-init.hash b/package/s6-linux-init/s6-linux-init.hash
index 8f3c7fa297..ea5f58995a 100644
--- a/package/s6-linux-init/s6-linux-init.hash
+++ b/package/s6-linux-init/s6-linux-init.hash
@@ -1,3 +1,3 @@
 # Locally generated
-sha256 d4ac9b8bde3e678353c85dad1a2a25066a40f843c53840c4210839068635ed7e  s6-linux-init-0.4.0.0.tar.gz
-sha256 1377d3b18a31de11e8bb06f0f46888a23bc16cbc57285035793bf7e7943bbcb3  COPYING
+sha256 a48dd2fb78a719d586f3f174b1a06fdf1c125839cee52e6a47d83cdb251529be  s6-linux-init-1.0.3.0.tar.gz
+sha256 487e89990a571700bcdf7c0cbbde2859446f79e85e8b59791adab98fff6b1889  COPYING
diff --git a/package/s6-linux-init/s6-linux-init.mk b/package/s6-linux-init/s6-linux-init.mk
index d25504ae5a..095ae13d14 100644
--- a/package/s6-linux-init/s6-linux-init.mk
+++ b/package/s6-linux-init/s6-linux-init.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-S6_LINUX_INIT_VERSION = 0.4.0.0
+S6_LINUX_INIT_VERSION = 1.0.3.0
 S6_LINUX_INIT_SITE = http://skarnet.org/software/s6-linux-init
 S6_LINUX_INIT_LICENSE = ISC
 S6_LINUX_INIT_LICENSE_FILES = COPYING
