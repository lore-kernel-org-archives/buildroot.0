From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 7 Sep 2019 14:25:04 +0200
Subject: [Buildroot] [git commit] package/monit: bump to version 5.26.0
Message-ID: <20190907122436.303628B768@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ad250c3d1884c0e7d9966ef626b58c66aa6c682f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/monit/monit.hash | 2 +-
 package/monit/monit.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/monit/monit.hash b/package/monit/monit.hash
index 3f528590d6..0de0d675aa 100644
--- a/package/monit/monit.hash
+++ b/package/monit/monit.hash
@@ -1,4 +1,4 @@
 # From https://mmonit.com/monit/dist/monit-5.25.3.tar.gz.sha256:
-sha256  c10258c8839d20864d30390e7cbf2ff5e0480a67a6fb80c02aa457d6e3390569  monit-5.25.3.tar.gz
+sha256  87fc4568a3af9a2be89040efb169e3a2e47b262f99e78d5ddde99dd89f02f3c2  monit-5.26.0.tar.gz
 # Locally computed
 sha256  d5a4f52b1a5e1e7fe14e01a76aac8b08dc6bbea15466058f271456c97aac1ada  COPYING
diff --git a/package/monit/monit.mk b/package/monit/monit.mk
index 980da13cb6..93e310ff78 100644
--- a/package/monit/monit.mk
+++ b/package/monit/monit.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MONIT_VERSION = 5.25.3
+MONIT_VERSION = 5.26.0
 MONIT_SITE = http://mmonit.com/monit/dist
 MONIT_LICENSE = AGPL-3.0 with OpenSSL exception
 MONIT_LICENSE_FILES = COPYING
