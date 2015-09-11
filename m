From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Fri, 11 Sep 2015 12:57:50 +0100
Subject: [Buildroot] [PATCH] git: bump version to 2.5.2
Message-ID: <1441972670-16962-1-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/git/git.hash |    2 +-
 package/git/git.mk   |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/git/git.hash b/package/git/git.hash
index 81caf39..6201986 100644
--- a/package/git/git.hash
+++ b/package/git/git.hash
@@ -1,2 +1,2 @@
 # From: https://www.kernel.org/pub/software/scm/git/sha256sums.asc
-sha256  c31a5f5f72e025f8fe26845032a06683c7e5c1a73236c2353b5606ddd22e0494  git-2.4.5.tar.xz
+sha256  4b4760a90ede51accee703bd6815f1f79afef68670acdcf3ea31dcc846a40c9b  git-2.5.2.tar.xz
diff --git a/package/git/git.mk b/package/git/git.mk
index e2d04aa..bd852df 100644
--- a/package/git/git.mk
+++ b/package/git/git.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GIT_VERSION = 2.4.5
+GIT_VERSION = 2.5.2
 GIT_SOURCE = git-$(GIT_VERSION).tar.xz
 GIT_SITE = https://www.kernel.org/pub/software/scm/git
 GIT_LICENSE = GPLv2 LGPLv2.1+
-- 
1.7.1
