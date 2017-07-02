From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 2 Jul 2017 23:33:06 +0200
Subject: [Buildroot] [git commit] s6-linux-utils: bump version to 2.4.0.0
Message-ID: <20170702213032.01E7980641@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a725b9b79c4bd1aa4b94a41dcefc45af507a400a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/s6-linux-utils/s6-linux-utils.hash | 2 +-
 package/s6-linux-utils/s6-linux-utils.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/s6-linux-utils/s6-linux-utils.hash b/package/s6-linux-utils/s6-linux-utils.hash
index 600c5fc..66feb9d 100644
--- a/package/s6-linux-utils/s6-linux-utils.hash
+++ b/package/s6-linux-utils/s6-linux-utils.hash
@@ -1,2 +1,2 @@
 # Locally generated
-sha256 587745abfbf2cc631bb54dd2b3fd29f39b723e3c50e28165138a85c98fda35f9 s6-linux-utils-2.2.0.0.tar.gz
+sha256 3afb7b972a9d54042ac0aabde5489be90039374b6a90ef45f7f32ce2e83d1e63  s6-linux-utils-2.4.0.0.tar.gz
diff --git a/package/s6-linux-utils/s6-linux-utils.mk b/package/s6-linux-utils/s6-linux-utils.mk
index 04ce688..7d346d6 100644
--- a/package/s6-linux-utils/s6-linux-utils.mk
+++ b/package/s6-linux-utils/s6-linux-utils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-S6_LINUX_UTILS_VERSION = 2.2.0.0
+S6_LINUX_UTILS_VERSION = 2.4.0.0
 S6_LINUX_UTILS_SITE = http://skarnet.org/software/s6-linux-utils
 S6_LINUX_UTILS_LICENSE = ISC
 S6_LINUX_UTILS_LICENSE_FILES = COPYING
