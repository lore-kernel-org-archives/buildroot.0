From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Thu, 18 Jun 2015 18:44:24 +0200
Subject: [Buildroot] [PATCH 01/10] git: bump to version 2.4.4
Message-ID: <1434645873-26849-1-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- Bump to version 2.4.4
- Update hash file

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/git/git.hash | 2 +-
 package/git/git.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/git/git.hash b/package/git/git.hash
index 8cc7be7..cb4ce13 100644
--- a/package/git/git.hash
+++ b/package/git/git.hash
@@ -1,2 +1,2 @@
 # From: https://www.kernel.org/pub/software/scm/git/sha256sums.asc
-sha256  18eb8462026a55ab34a657282e894bdaad331ea59bfebeba5eb45b27b58cf825  git-2.3.2.tar.xz
+sha256  f873b15d42281474fcba5921295d01e48a3cd3cddcbeb3d60176bf30f5f30260  git-2.4.4.tar.xz
diff --git a/package/git/git.mk b/package/git/git.mk
index 845c24e..50e5d7b 100644
--- a/package/git/git.mk
+++ b/package/git/git.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GIT_VERSION = 2.3.2
+GIT_VERSION = 2.4.4
 GIT_SOURCE = git-$(GIT_VERSION).tar.xz
 GIT_SITE = https://www.kernel.org/pub/software/scm/git
 GIT_LICENSE = GPLv2 LGPLv2.1+
-- 
2.3.6
