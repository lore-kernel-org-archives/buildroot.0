From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Wed, 1 Jul 2015 13:39:34 +0200
Subject: [Buildroot] [PATCH 1/3] git: bump to version 2.4.5
Message-ID: <1435750776-3364-1-git-send-email-Vincent.Riera@imgtec.com>
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
index cb4ce13..81caf39 100644
--- a/package/git/git.hash
+++ b/package/git/git.hash
@@ -1,2 +1,2 @@
 # From: https://www.kernel.org/pub/software/scm/git/sha256sums.asc
-sha256  f873b15d42281474fcba5921295d01e48a3cd3cddcbeb3d60176bf30f5f30260  git-2.4.4.tar.xz
+sha256  c31a5f5f72e025f8fe26845032a06683c7e5c1a73236c2353b5606ddd22e0494  git-2.4.5.tar.xz
diff --git a/package/git/git.mk b/package/git/git.mk
index 50e5d7b..e2d04aa 100644
--- a/package/git/git.mk
+++ b/package/git/git.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GIT_VERSION = 2.4.4
+GIT_VERSION = 2.4.5
 GIT_SOURCE = git-$(GIT_VERSION).tar.xz
 GIT_SITE = https://www.kernel.org/pub/software/scm/git
 GIT_LICENSE = GPLv2 LGPLv2.1+
-- 
2.3.6
