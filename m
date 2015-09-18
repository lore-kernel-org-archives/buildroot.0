From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Fri, 18 Sep 2015 12:07:51 +0100
Subject: [Buildroot] [PATCH 2/3] git: bump to version 2.5.3
In-Reply-To: <1442574472-47392-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1442574472-47392-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <1442574472-47392-2-git-send-email-Vincent.Riera@imgtec.com>
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
index 6201986..c669d53 100644
--- a/package/git/git.hash
+++ b/package/git/git.hash
@@ -1,2 +1,2 @@
 # From: https://www.kernel.org/pub/software/scm/git/sha256sums.asc
-sha256  4b4760a90ede51accee703bd6815f1f79afef68670acdcf3ea31dcc846a40c9b  git-2.5.2.tar.xz
+sha256 124d29d857a1282fd2111cf4a021f156e8bae917f455b4551b2aea87f0453a1a  git-2.5.3.tar.xz
diff --git a/package/git/git.mk b/package/git/git.mk
index bd852df..720528e 100644
--- a/package/git/git.mk
+++ b/package/git/git.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GIT_VERSION = 2.5.2
+GIT_VERSION = 2.5.3
 GIT_SOURCE = git-$(GIT_VERSION).tar.xz
 GIT_SITE = https://www.kernel.org/pub/software/scm/git
 GIT_LICENSE = GPLv2 LGPLv2.1+
-- 
1.7.1
