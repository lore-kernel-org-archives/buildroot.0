From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Tue, 3 May 2016 14:08:39 +0100
Subject: [Buildroot] [PATCH 1/4] git: bump version to 2.8.2
Message-ID: <1462280922-17100-1-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
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
-- 
2.7.3
