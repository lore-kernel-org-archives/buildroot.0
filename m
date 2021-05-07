From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 7 May 2021 10:42:32 +0200
Subject: [Buildroot] [git commit branch/2021.02.x] package/libfuse3: bump
 version to 3.10.3
Message-ID: <20210507081607.62DD586283@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d66c6bf5e56883cb5bf8512b3f5a2528fe5b1b7c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

Signed-off-by: Christian Stewart <christian@paral.in>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 0b09d6feaaba83c8f980e9582c5d2b4a89c31b2f)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libfuse3/libfuse3.hash | 2 +-
 package/libfuse3/libfuse3.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libfuse3/libfuse3.hash b/package/libfuse3/libfuse3.hash
index 9b2f8cc144..49c71f402f 100644
--- a/package/libfuse3/libfuse3.hash
+++ b/package/libfuse3/libfuse3.hash
@@ -1,3 +1,3 @@
 # Locally calculated sha256 checksums
-sha256  a16f93cc083264afd0d2958a0dc88f24c6c5d40a9f3842c645b1909e13edb75f  libfuse3-3.10.2.tar.gz
+sha256  c32527782cef620df58b162aa29901d1fb13253b029375d5860a2253a810344e  libfuse3-3.10.3.tar.gz
 sha256  b8832d9caaa075bbbd2aef24efa09f8b7ab66a832812d88c602da0c7b4397fad  LICENSE
diff --git a/package/libfuse3/libfuse3.mk b/package/libfuse3/libfuse3.mk
index f805eda506..d61e313391 100644
--- a/package/libfuse3/libfuse3.mk
+++ b/package/libfuse3/libfuse3.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBFUSE3_VERSION = 3.10.2
+LIBFUSE3_VERSION = 3.10.3
 LIBFUSE3_SITE = $(call github,libfuse,libfuse,fuse-$(LIBFUSE3_VERSION))
 LIBFUSE3_LICENSE = LGPL-2.1
 LIBFUSE3_LICENSE_FILES = LICENSE
