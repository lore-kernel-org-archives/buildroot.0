From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 7 Mar 2015 17:41:40 +0100
Subject: [Buildroot] [git commit] git: bump version to 2.3.2
Message-ID: <20150308071605.6D596807C1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9a426b6bcb6dc1d572bd926981f979e7f017a0e3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Bump version to 2.3.2
- Update the hash file

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/git/git.hash |    2 +-
 package/git/git.mk   |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/git/git.hash b/package/git/git.hash
index aa81df5..8cc7be7 100644
--- a/package/git/git.hash
+++ b/package/git/git.hash
@@ -1,2 +1,2 @@
 # From: https://www.kernel.org/pub/software/scm/git/sha256sums.asc
-sha256  1acc4b051576143eb41d80f5675476629588c7c5fb4e6a1dc2c4590f47c498b7  git-2.3.1.tar.xz
+sha256  18eb8462026a55ab34a657282e894bdaad331ea59bfebeba5eb45b27b58cf825  git-2.3.2.tar.xz
diff --git a/package/git/git.mk b/package/git/git.mk
index 0672d6e..fc7b6fe 100644
--- a/package/git/git.mk
+++ b/package/git/git.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GIT_VERSION = 2.3.1
+GIT_VERSION = 2.3.2
 GIT_SOURCE = git-$(GIT_VERSION).tar.xz
 GIT_SITE = https://www.kernel.org/pub/software/scm/git
 GIT_LICENSE = GPLv2 LGPLv2.1+
