From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 9 Sep 2017 22:01:55 +0200
Subject: [Buildroot] [git commit] s6-linux-init: bump version to 0.3.1.0
Message-ID: <20170909195854.A203D81014@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=db91484ddef149d99b83e8b7a6b7e9bcac44dbfb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/s6-linux-init/s6-linux-init.hash | 2 +-
 package/s6-linux-init/s6-linux-init.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/s6-linux-init/s6-linux-init.hash b/package/s6-linux-init/s6-linux-init.hash
index babcb2a..80068ba 100644
--- a/package/s6-linux-init/s6-linux-init.hash
+++ b/package/s6-linux-init/s6-linux-init.hash
@@ -1,2 +1,2 @@
 # Locally generated
-sha256 9376f76ae3ab24cb18a35a6956d0fa5fe88cc4c1dfd19bbafc47dcd4f91c2535  s6-linux-init-0.3.0.0.tar.gz
+sha256 d8854a01f41db88250b73bdff3a636ed31810b1c309acb2d724380c8b69aedd6  s6-linux-init-0.3.1.0.tar.gz
diff --git a/package/s6-linux-init/s6-linux-init.mk b/package/s6-linux-init/s6-linux-init.mk
index e2dc26e..be968ba 100644
--- a/package/s6-linux-init/s6-linux-init.mk
+++ b/package/s6-linux-init/s6-linux-init.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-S6_LINUX_INIT_VERSION = 0.3.0.0
+S6_LINUX_INIT_VERSION = 0.3.1.0
 S6_LINUX_INIT_SITE = http://skarnet.org/software/s6-linux-init
 S6_LINUX_INIT_LICENSE = ISC
 S6_LINUX_INIT_LICENSE_FILES = COPYING
