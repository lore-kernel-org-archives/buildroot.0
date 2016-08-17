From: Rodrigo Rebello <rprebello@gmail.com>
Date: Tue, 16 Aug 2016 21:10:38 -0300
Subject: [Buildroot] [PATCH 1/1] git: bump version to 2.9.3
Message-ID: <1471392638-21456-1-git-send-email-rprebello@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Rodrigo Rebello <rprebello@gmail.com>
---
 package/git/git.hash | 2 +-
 package/git/git.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/git/git.hash b/package/git/git.hash
index e7763f3..9776df1 100644
--- a/package/git/git.hash
+++ b/package/git/git.hash
@@ -1,2 +1,2 @@
 # From: https://www.kernel.org/pub/software/scm/git/sha256sums.asc
-sha256 e8fe60bc72c1c979feb43740b3c74fea7f8ffbe7712b71cd9734ddb9c89282a2  git-2.9.1.tar.xz
+sha256 9f1473350c1792310b51af03a9cb5cce841f68202f835b20d46312a30232fa63  git-2.9.3.tar.xz
diff --git a/package/git/git.mk b/package/git/git.mk
index 2f28200..d9cd95a 100644
--- a/package/git/git.mk
+++ b/package/git/git.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GIT_VERSION = 2.9.1
+GIT_VERSION = 2.9.3
 GIT_SOURCE = git-$(GIT_VERSION).tar.xz
 GIT_SITE = https://www.kernel.org/pub/software/scm/git
 GIT_LICENSE = GPLv2 LGPLv2.1+
-- 
2.1.4
