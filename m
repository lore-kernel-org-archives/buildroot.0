From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 4 May 2016 22:45:26 +0200
Subject: [Buildroot] [git commit] git: bump version to 2.8.2
Message-ID: <20160504205128.617A9802B5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f3698c600c43e0c2b9a5b210aa9a88946d35d6dc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/git/git.hash | 2 +-
 package/git/git.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/git/git.hash b/package/git/git.hash
index 923f05d..dabe964 100644
--- a/package/git/git.hash
+++ b/package/git/git.hash
@@ -1,2 +1,2 @@
 # From: https://www.kernel.org/pub/software/scm/git/sha256sums.asc
-sha256 e6626b43ba4bc63ad4918df4c275f50bd7f8af2ab54bde60496ad75e91e927fc  git-2.8.1.tar.xz
+sha256 ec0283d78a0f1c8408c5fd43610697b953fbaafe4077bb1e41446a9ee3a2f83d  git-2.8.2.tar.xz
diff --git a/package/git/git.mk b/package/git/git.mk
index 517f9db..db26036 100644
--- a/package/git/git.mk
+++ b/package/git/git.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GIT_VERSION = 2.8.1
+GIT_VERSION = 2.8.2
 GIT_SOURCE = git-$(GIT_VERSION).tar.xz
 GIT_SITE = https://www.kernel.org/pub/software/scm/git
 GIT_LICENSE = GPLv2 LGPLv2.1+
