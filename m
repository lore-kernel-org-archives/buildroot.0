From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 17 Aug 2016 15:04:23 +0200
Subject: [Buildroot] [git commit branch/next] git: bump version to 2.9.3
Message-ID: <20160817130538.C9D7782125@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ca4237c766fe2d0d494ed3d4b91a483728147349
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Rodrigo Rebello <rprebello@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
