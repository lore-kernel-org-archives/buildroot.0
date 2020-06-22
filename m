From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 22 Jun 2020 21:11:58 +0200
Subject: [Buildroot] [git commit] package/haveged: bump to version 1.9.12
Message-ID: <20200622191618.B24D38152B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b324450ef9baadd4b57b7216c583d9ee2b5d74a2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This includes the following changes:

9adede5 Bumped version to 1.9.12
7487642 Merge pull request #40 from PrinterFranklin/fix_memory_leak
cbef34b fix a memory leak in havege_destroy
02674ae Updated ChangeLog
1ce2092 Update README.md
b77e7db Create README.md
f5bd6fa Updated version to v1.9.11
68b1d84 Merge branch 'master' of https://github.com/jirka-h/haveged
fb12bb3 updated fedora.spec
b162c91 Merge pull request #35 from eworm-de/private-tmp
b839803 Merge pull request #34 from Chocobo1/gh_action
4a0a008 Replace @SBIN_DIR@ in haveged.service file with actual path
c216a6f Moved haveged.spec to fedora.spec
2098470 fix ordering cycle with private tmp
7cd68e1 Add GitHub Actions continuous integration script
ebe97f0 Fixed time format

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/haveged/haveged.hash | 2 +-
 package/haveged/haveged.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/haveged/haveged.hash b/package/haveged/haveged.hash
index 2f1338a6a8..1394b0440a 100644
--- a/package/haveged/haveged.hash
+++ b/package/haveged/haveged.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  13a0d81bb395c6ebde70a6474452001d9f898d786ddf4872af9f9f96f9e99ded  haveged-1.9.9.tar.gz
+sha256  0b8642515ea7189a1772cdb8072b98a6768cf9b963faf3cd664329fd79975ffa  haveged-1.9.12.tar.gz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/haveged/haveged.mk b/package/haveged/haveged.mk
index 40fa1c7c15..d7b5191a6f 100644
--- a/package/haveged/haveged.mk
+++ b/package/haveged/haveged.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HAVEGED_VERSION = 1.9.9
+HAVEGED_VERSION = 1.9.12
 HAVEGED_SITE = $(call github,jirka-h,haveged,v$(HAVEGED_VERSION))
 HAVEGED_LICENSE = GPL-3.0+
 HAVEGED_LICENSE_FILES = COPYING
