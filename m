From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 4 Jun 2020 23:19:36 +0200
Subject: [Buildroot] [git commit] package/iwd: bump version to 1.7
Message-ID: <20200604212152.0B0CF7F9B7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=96f0f7b80be5404ed10f28854a05921c0a6c4bed
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/iwd/iwd.hash | 2 +-
 package/iwd/iwd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/iwd/iwd.hash b/package/iwd/iwd.hash
index 26ce712660..9c6b9c3ea4 100644
--- a/package/iwd/iwd.hash
+++ b/package/iwd/iwd.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256  10b53cee9c38c9c60f83d4e16a446b27551b6187a2bd09d724f2238c99877f3f  iwd-1.6.tar.gz
+sha256  1707397235c972a2760c5e8865360759ac1feb6c06ac954799dff765feb240ca  iwd-1.7.tar.gz
 
 # License files
 sha256  ec60b993835e2c6b79e6d9226345f4e614e686eb57dc13b6420c15a33a8996e5  COPYING
diff --git a/package/iwd/iwd.mk b/package/iwd/iwd.mk
index f3776fbfd4..32ff175933 100644
--- a/package/iwd/iwd.mk
+++ b/package/iwd/iwd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IWD_VERSION = 1.6
+IWD_VERSION = 1.7
 IWD_SITE = https://git.kernel.org/pub/scm/network/wireless/iwd.git
 IWD_SITE_METHOD = git
 IWD_LICENSE = LGPL-2.1+
