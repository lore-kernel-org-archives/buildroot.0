From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 1 May 2018 21:29:33 +0200
Subject: [Buildroot] [git commit] s6-linux-init: bump version to 0.4.0.0
Message-ID: <20180501192947.D40198A665@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=28851ac7d18f87f151d5fcf6c93f07f4231f6da1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/s6-linux-init/s6-linux-init.hash | 2 +-
 package/s6-linux-init/s6-linux-init.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/s6-linux-init/s6-linux-init.hash b/package/s6-linux-init/s6-linux-init.hash
index 03aeaf3abf..f658b259cb 100644
--- a/package/s6-linux-init/s6-linux-init.hash
+++ b/package/s6-linux-init/s6-linux-init.hash
@@ -1,3 +1,3 @@
 # Locally generated
-sha256 9ee2e8a5abc250bcb2be7d07566592ba5cbe3abce858f60853d3ac45b1ccdd79  s6-linux-init-0.3.1.1.tar.gz
+sha256 d4ac9b8bde3e678353c85dad1a2a25066a40f843c53840c4210839068635ed7e  s6-linux-init-0.4.0.0.tar.gz
 sha256 43cdbc05eceb0781d71a0661bbb6b9335efc4b733fbd02847c0c6667fd440993  COPYING
diff --git a/package/s6-linux-init/s6-linux-init.mk b/package/s6-linux-init/s6-linux-init.mk
index c5dee02865..d25504ae5a 100644
--- a/package/s6-linux-init/s6-linux-init.mk
+++ b/package/s6-linux-init/s6-linux-init.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-S6_LINUX_INIT_VERSION = 0.3.1.1
+S6_LINUX_INIT_VERSION = 0.4.0.0
 S6_LINUX_INIT_SITE = http://skarnet.org/software/s6-linux-init
 S6_LINUX_INIT_LICENSE = ISC
 S6_LINUX_INIT_LICENSE_FILES = COPYING
