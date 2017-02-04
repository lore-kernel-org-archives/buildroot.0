From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat,  4 Feb 2017 12:31:53 +0100
Subject: [Buildroot] [PATCH 1/1] package/git: bump version to 2.11.1
Message-ID: <20170204113153.11242-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/git/git.hash | 2 +-
 package/git/git.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/git/git.hash b/package/git/git.hash
index ee7615797..07ed47bd0 100644
--- a/package/git/git.hash
+++ b/package/git/git.hash
@@ -1,2 +1,2 @@
 # From: https://www.kernel.org/pub/software/scm/git/sha256sums.asc
-sha256 7e7e8d69d494892373b87007674be5820a4bc1ef596a0117d03ea3169119fd0b  git-2.11.0.tar.xz
+sha256 c0a779cae325d48a1d5ba08b6ee1febcc31d0657a6da01fd1dec1c6e10976415  git-2.11.1.tar.xz
diff --git a/package/git/git.mk b/package/git/git.mk
index f47209a74..bb97193d3 100644
--- a/package/git/git.mk
+++ b/package/git/git.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GIT_VERSION = 2.11.0
+GIT_VERSION = 2.11.1
 GIT_SOURCE = git-$(GIT_VERSION).tar.xz
 GIT_SITE = https://www.kernel.org/pub/software/scm/git
 GIT_LICENSE = GPLv2 LGPLv2.1+
-- 
2.11.0
