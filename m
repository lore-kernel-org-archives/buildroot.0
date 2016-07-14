From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Thu, 14 Jul 2016 11:07:18 +0100
Subject: [Buildroot] [PATCH] git: bump version to 2.9.1
Message-ID: <1468490838-62992-1-git-send-email-Vincent.Riera@imgtec.com>
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
index 9e047a3..e7763f3 100644
--- a/package/git/git.hash
+++ b/package/git/git.hash
@@ -1,2 +1,2 @@
 # From: https://www.kernel.org/pub/software/scm/git/sha256sums.asc
-sha256 7d8e6c274a88b4a73b3c98c70d3438ec12871300ce8bb4ca179ea19fcf74aa91  git-2.8.3.tar.xz
+sha256 e8fe60bc72c1c979feb43740b3c74fea7f8ffbe7712b71cd9734ddb9c89282a2  git-2.9.1.tar.xz
diff --git a/package/git/git.mk b/package/git/git.mk
index 1d6574d..2f28200 100644
--- a/package/git/git.mk
+++ b/package/git/git.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GIT_VERSION = 2.8.3
+GIT_VERSION = 2.9.1
 GIT_SOURCE = git-$(GIT_VERSION).tar.xz
 GIT_SITE = https://www.kernel.org/pub/software/scm/git
 GIT_LICENSE = GPLv2 LGPLv2.1+
-- 
2.7.3
