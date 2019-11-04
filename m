From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 4 Nov 2019 22:39:26 +0100
Subject: [Buildroot] [git commit] package/s6: bump version to 2.9.0.1
Message-ID: <20191104213334.C4BB88E74B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=53b71dea3909d6cf881669c3e3de7e0b424eefe9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/s6/s6.hash | 2 +-
 package/s6/s6.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/s6/s6.hash b/package/s6/s6.hash
index 8949206564..9b355351ea 100644
--- a/package/s6/s6.hash
+++ b/package/s6/s6.hash
@@ -1,3 +1,3 @@
 # Locally generated
-sha256 1cac59bf9ff7c011b189ae2def3c76b147c2c431b0a901029fcaf957a6d9a343  s6-2.9.0.0.tar.gz
+sha256 e0cdbaf26e3ba1c41ecc0a8d1f45fb78194f96109b55cabeb849528b7e966c57  s6-2.9.0.1.tar.gz
 sha256 d8e17a6418d26867c13801810903a1f78beac8cfe8f92c2a85afe59f3c3fc48c  COPYING
diff --git a/package/s6/s6.mk b/package/s6/s6.mk
index 17a1342432..ec1407381e 100644
--- a/package/s6/s6.mk
+++ b/package/s6/s6.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-S6_VERSION = 2.9.0.0
+S6_VERSION = 2.9.0.1
 S6_SITE = http://skarnet.org/software/s6
 S6_LICENSE = ISC
 S6_LICENSE_FILES = COPYING
