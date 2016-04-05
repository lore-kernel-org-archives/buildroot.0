From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Tue, 5 Apr 2016 13:55:53 +0100
Subject: [Buildroot] [PATCH] git: bump version to 2.8.1
Message-ID: <1459860953-53001-1-git-send-email-Vincent.Riera@imgtec.com>
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
index 7eac6a0..923f05d 100644
--- a/package/git/git.hash
+++ b/package/git/git.hash
@@ -1,2 +1,2 @@
 # From: https://www.kernel.org/pub/software/scm/git/sha256sums.asc
-sha256 9a099a4f1e68c0446800f0c538ce7d5d24bd5b4ee5d559317600cd407a59e74c  git-2.8.0.tar.xz
+sha256 e6626b43ba4bc63ad4918df4c275f50bd7f8af2ab54bde60496ad75e91e927fc  git-2.8.1.tar.xz
diff --git a/package/git/git.mk b/package/git/git.mk
index 3c06cbd..517f9db 100644
--- a/package/git/git.mk
+++ b/package/git/git.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GIT_VERSION = 2.8.0
+GIT_VERSION = 2.8.1
 GIT_SOURCE = git-$(GIT_VERSION).tar.xz
 GIT_SITE = https://www.kernel.org/pub/software/scm/git
 GIT_LICENSE = GPLv2 LGPLv2.1+
-- 
2.7.3
