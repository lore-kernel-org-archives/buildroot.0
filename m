From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Mon, 5 Sep 2016 14:40:11 +0100
Subject: [Buildroot] [PATCH 5/6] git: bump version to 2.10.0
In-Reply-To: <1473082812-690-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1473082812-690-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <1473082812-690-5-git-send-email-Vincent.Riera@imgtec.com>
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
index 9776df1..e2cf300 100644
--- a/package/git/git.hash
+++ b/package/git/git.hash
@@ -1,2 +1,2 @@
 # From: https://www.kernel.org/pub/software/scm/git/sha256sums.asc
-sha256 9f1473350c1792310b51af03a9cb5cce841f68202f835b20d46312a30232fa63  git-2.9.3.tar.xz
+sha256 c73364ac00ae85ffc6cfb12ca2700bb0edf30f63262be97be4039be594ff29e7  git-2.10.0.tar.xz
diff --git a/package/git/git.mk b/package/git/git.mk
index d9cd95a..3730b77 100644
--- a/package/git/git.mk
+++ b/package/git/git.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GIT_VERSION = 2.9.3
+GIT_VERSION = 2.10.0
 GIT_SOURCE = git-$(GIT_VERSION).tar.xz
 GIT_SITE = https://www.kernel.org/pub/software/scm/git
 GIT_LICENSE = GPLv2 LGPLv2.1+
-- 
2.7.3
