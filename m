From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 13 Jul 2020 23:12:25 +0200
Subject: [Buildroot] [git commit] package/parprouted: bump version to 0.7
Message-ID: <20200713210928.6DA6E81763@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0a4b1801e7c5fd0a178c43bf0ec0e339d15ef2dd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This was supposed to be part of
fce71d09fb139ed2b29ad1f3158da50731c7ca48, which introduced the
parprouted package, but due to a missed "git commit --amend", it
wasn't included in this commit, so let's add it now.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/parprouted/parprouted.hash | 2 +-
 package/parprouted/parprouted.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/parprouted/parprouted.hash b/package/parprouted/parprouted.hash
index ec73f92168..d35691b62a 100644
--- a/package/parprouted/parprouted.hash
+++ b/package/parprouted/parprouted.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  4b8cb2c801047f26b63aefaa8d69adc8552fb7c8a8f5d851798a48f841948d36  parprouted-0.65.tar.gz
+sha256  d63643c95d4149a3d71112da5892f459433456bf0279bfa304625f109178defc  parprouted-0.7.tar.gz
 sha256  dcc100d4161cc0b7177545ab6e47216f84857cda3843847c792a25289852dcaa  COPYING
diff --git a/package/parprouted/parprouted.mk b/package/parprouted/parprouted.mk
index 09565787c2..a0425d92cd 100644
--- a/package/parprouted/parprouted.mk
+++ b/package/parprouted/parprouted.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PARPROUTED_VERSION = 0.65
+PARPROUTED_VERSION = 0.7
 PARPROUTED_SITE = https://www.hazard.maks.net/parprouted
 PARPROUTED_LICENSE = GPL-2.0
 PARPROUTED_LICENSE_FILES = COPYING
