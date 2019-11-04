From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 4 Nov 2019 22:39:33 +0100
Subject: [Buildroot] [git commit] package/s6-linux-init: bump version to
 1.0.3.1
Message-ID: <20191104213334.D68568E74D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9709dfb633114e712ba896d2c6df10f23d024a91
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/s6-linux-init/s6-linux-init.hash | 2 +-
 package/s6-linux-init/s6-linux-init.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/s6-linux-init/s6-linux-init.hash b/package/s6-linux-init/s6-linux-init.hash
index ea5f58995a..bc2f7072ca 100644
--- a/package/s6-linux-init/s6-linux-init.hash
+++ b/package/s6-linux-init/s6-linux-init.hash
@@ -1,3 +1,3 @@
 # Locally generated
-sha256 a48dd2fb78a719d586f3f174b1a06fdf1c125839cee52e6a47d83cdb251529be  s6-linux-init-1.0.3.0.tar.gz
+sha256 216af5589c2bc5dbdea6b6c94d55575c12e31f57b2e0fde5c534a840aeed02fb  s6-linux-init-1.0.3.1.tar.gz
 sha256 487e89990a571700bcdf7c0cbbde2859446f79e85e8b59791adab98fff6b1889  COPYING
diff --git a/package/s6-linux-init/s6-linux-init.mk b/package/s6-linux-init/s6-linux-init.mk
index 095ae13d14..71c727de02 100644
--- a/package/s6-linux-init/s6-linux-init.mk
+++ b/package/s6-linux-init/s6-linux-init.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-S6_LINUX_INIT_VERSION = 1.0.3.0
+S6_LINUX_INIT_VERSION = 1.0.3.1
 S6_LINUX_INIT_SITE = http://skarnet.org/software/s6-linux-init
 S6_LINUX_INIT_LICENSE = ISC
 S6_LINUX_INIT_LICENSE_FILES = COPYING
