From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sun, 13 Jun 2021 18:34:26 +0200
Subject: [Buildroot] [git commit] package/ltp-testsuite: bump version to
 20210524
Message-ID: <20210613160439.C45A5817D5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=dc97260606d41fed2d1f8effc09cff7352440395
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add locally computed sha256 (+ keep sha1 from github checksum file).

sysinfo.h fix patch is still needed (until Buildroot MUSL toolchain gets
updated).

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/ltp-testsuite/ltp-testsuite.hash | 5 +++--
 package/ltp-testsuite/ltp-testsuite.mk   | 2 +-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/ltp-testsuite/ltp-testsuite.hash b/package/ltp-testsuite/ltp-testsuite.hash
index f0b2c89704..ed2a50cd4f 100644
--- a/package/ltp-testsuite/ltp-testsuite.hash
+++ b/package/ltp-testsuite/ltp-testsuite.hash
@@ -1,4 +1,5 @@
-# From: https://github.com/linux-test-project/ltp/releases/download/20210121/ltp-full-20210121.tar.xz.sha1
-sha1 ac9c1c711aed4319c5fbd0b665d36f75236a4ec2  ltp-full-20210121.tar.xz
+# From: https://github.com/linux-test-project/ltp/releases/download/20210524/ltp-full-20210524.tar.xz.sha1
+sha1 08d84f8ac3ba0c800f3070768c651703869105d7  ltp-full-20210524.tar.xz
 # Locally computed
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
+sha256  831678c64b85a8c24957c71632752537b2266890f2d2f352da9ed0ec45458189  ltp-full-20210524.tar.xz
diff --git a/package/ltp-testsuite/ltp-testsuite.mk b/package/ltp-testsuite/ltp-testsuite.mk
index 978d01b7a6..badd161d5a 100644
--- a/package/ltp-testsuite/ltp-testsuite.mk
+++ b/package/ltp-testsuite/ltp-testsuite.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LTP_TESTSUITE_VERSION = 20210121
+LTP_TESTSUITE_VERSION = 20210524
 LTP_TESTSUITE_SOURCE = ltp-full-$(LTP_TESTSUITE_VERSION).tar.xz
 LTP_TESTSUITE_SITE = https://github.com/linux-test-project/ltp/releases/download/$(LTP_TESTSUITE_VERSION)
 
