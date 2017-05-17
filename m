From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 17 May 2017 22:39:27 +0200
Subject: [Buildroot] [git commit branch/2017.02.x] git: bump version to
	2.12.1
Message-ID: <20170517204653.798C28295F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3e0057455967846a8c75e125587a0616d15774c8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit cbb23d5d053710da7667d9b77fc4665b2194d2af)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/git/git.hash | 2 +-
 package/git/git.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/git/git.hash b/package/git/git.hash
index 71e340e..e79e8b1 100644
--- a/package/git/git.hash
+++ b/package/git/git.hash
@@ -1,2 +1,2 @@
 # From: https://www.kernel.org/pub/software/scm/git/sha256sums.asc
-sha256 1821766479062d052cc1897d0ded95212e81e5c7f1039786bc4aec2225a32027  git-2.12.0.tar.xz
+sha256 db11674364b764e101966d829a2e271c9b9d2a8bd4d8ecb4221a1dcdc9a3ada2  git-2.12.1.tar.xz
diff --git a/package/git/git.mk b/package/git/git.mk
index 75d5140..e7ea98d 100644
--- a/package/git/git.mk
+++ b/package/git/git.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GIT_VERSION = 2.12.0
+GIT_VERSION = 2.12.1
 GIT_SOURCE = git-$(GIT_VERSION).tar.xz
 GIT_SITE = https://www.kernel.org/pub/software/scm/git
 GIT_LICENSE = GPLv2, LGPLv2.1+
