From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Fri, 20 May 2016 09:33:33 +0100
Subject: [Buildroot] [PATCH next] git: bump version to 2.8.3
Message-ID: <1463733213-54970-1-git-send-email-Vincent.Riera@imgtec.com>
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
index dabe964..9e047a3 100644
--- a/package/git/git.hash
+++ b/package/git/git.hash
@@ -1,2 +1,2 @@
 # From: https://www.kernel.org/pub/software/scm/git/sha256sums.asc
-sha256 ec0283d78a0f1c8408c5fd43610697b953fbaafe4077bb1e41446a9ee3a2f83d  git-2.8.2.tar.xz
+sha256 7d8e6c274a88b4a73b3c98c70d3438ec12871300ce8bb4ca179ea19fcf74aa91  git-2.8.3.tar.xz
diff --git a/package/git/git.mk b/package/git/git.mk
index db26036..1d6574d 100644
--- a/package/git/git.mk
+++ b/package/git/git.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GIT_VERSION = 2.8.2
+GIT_VERSION = 2.8.3
 GIT_SOURCE = git-$(GIT_VERSION).tar.xz
 GIT_SITE = https://www.kernel.org/pub/software/scm/git
 GIT_LICENSE = GPLv2 LGPLv2.1+
-- 
2.7.3
