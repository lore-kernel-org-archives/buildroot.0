From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 19 Jul 2021 23:35:45 +0200
Subject: [Buildroot] [git commit] package/gptfdisk: bump version to 1.0.8
Message-ID: <20210719210210.C369C8847E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

commit: https://git.buildroot.net/buildroot/commit/?id=e8085cc813a395b319fc723b10f39db0077f7d77
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
https://sourceforge.net/p/gptfdisk/code/ci/master/tree/NEWS

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/gptfdisk/gptfdisk.hash | 6 +++---
 package/gptfdisk/gptfdisk.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/gptfdisk/gptfdisk.hash b/package/gptfdisk/gptfdisk.hash
index 7894f2187d..caded358ec 100644
--- a/package/gptfdisk/gptfdisk.hash
+++ b/package/gptfdisk/gptfdisk.hash
@@ -1,5 +1,5 @@
-# From http://sourceforge.net/projects/gptfdisk/files/gptfdisk/1.0.7/
-sha1  406ab2596e1911c916dce677ce7e903076d94c6d  gptfdisk-1.0.7.tar.gz
+# From http://sourceforge.net/projects/gptfdisk/files/gptfdisk/1.0.8/
+sha1  c8824e779056158fa32887e415f5399a8646c3c5  gptfdisk-1.0.8.tar.gz
 # Locally computed
-sha256  754004b7f85b279287c7ac3c0469b1d7e0eae043a97a2e587b0560ca5f3828c0  gptfdisk-1.0.7.tar.gz
+sha256  95d19856f004dabc4b8c342b2612e8d0a9eebdd52004297188369f152e9dc6df  gptfdisk-1.0.8.tar.gz
 sha256  231f7edcc7352d7734a96eef0b8030f77982678c516876fcb81e25b32d68564c  COPYING
diff --git a/package/gptfdisk/gptfdisk.mk b/package/gptfdisk/gptfdisk.mk
index d92a527105..9869975f51 100644
--- a/package/gptfdisk/gptfdisk.mk
+++ b/package/gptfdisk/gptfdisk.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GPTFDISK_VERSION = 1.0.7
+GPTFDISK_VERSION = 1.0.8
 GPTFDISK_SITE = http://downloads.sourceforge.net/sourceforge/gptfdisk
 GPTFDISK_LICENSE = GPL-2.0+
 GPTFDISK_LICENSE_FILES = COPYING
