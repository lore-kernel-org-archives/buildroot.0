From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Sat, 7 Feb 2015 16:27:14 +0000
Subject: [Buildroot] [PATCH] git: bump verstion to 2.3.0
Message-ID: <1423326434-39794-1-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- Bump version to 2.3.0
- Update the hash file

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/git/git.hash |    2 +-
 package/git/git.mk   |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/git/git.hash b/package/git/git.hash
index 757546d..ba3a3ea 100644
--- a/package/git/git.hash
+++ b/package/git/git.hash
@@ -1,2 +1,2 @@
 # From: https://www.kernel.org/pub/software/scm/git/sha256sums.asc
-sha256  09422dc9a0bdddf6bdd5b8634c71e1ed3125256c47424e6a2687701e764ef450  git-2.2.1.tar.xz
+sha256  94b23a14d66df536cfe7de37551f55acf908f8bddf30a0f5325a255bb57b0aca  git-2.3.0.tar.xz
diff --git a/package/git/git.mk b/package/git/git.mk
index face062..b5244ac 100644
--- a/package/git/git.mk
+++ b/package/git/git.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GIT_VERSION = 2.2.1
+GIT_VERSION = 2.3.0
 GIT_SOURCE = git-$(GIT_VERSION).tar.xz
 GIT_SITE = https://www.kernel.org/pub/software/scm/git
 GIT_LICENSE = GPLv2 LGPLv2.1+
-- 
1.7.1
