From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Mon, 31 Oct 2016 16:31:23 +0000
Subject: [Buildroot] [PATCH 1/3] git: bump version to 2.10.2
Message-ID: <20161031163125.14131-1-Vincent.Riera@imgtec.com>
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
index 73bb9cb..0815641 100644
--- a/package/git/git.hash
+++ b/package/git/git.hash
@@ -1,2 +1,2 @@
 # From: https://www.kernel.org/pub/software/scm/git/sha256sums.asc
-sha256 a9c32df9061cfc2c194ecaa0357ba273c1f24a0dbf0d856b03dcedafcd0a4dc6  git-2.10.1.tar.xz
+sha256 94802903dd707d85ca3b9a2be35e936a54ce86375f52c6a789efe7ce7e238671  git-2.10.2.tar.xz
diff --git a/package/git/git.mk b/package/git/git.mk
index 8bc2907..a7768ac 100644
--- a/package/git/git.mk
+++ b/package/git/git.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GIT_VERSION = 2.10.1
+GIT_VERSION = 2.10.2
 GIT_SOURCE = git-$(GIT_VERSION).tar.xz
 GIT_SITE = https://www.kernel.org/pub/software/scm/git
 GIT_LICENSE = GPLv2 LGPLv2.1+
-- 
2.10.1
