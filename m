From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 7 Feb 2015 17:40:59 +0100
Subject: [Buildroot] [git commit] git: bump verstion to 2.3.0
Message-ID: <20150207164213.15DB180469@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=58c1d5baed0c5a3d8ac215bd1b05d69b3f7c319d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Bump version to 2.3.0
- Update the hash file

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
