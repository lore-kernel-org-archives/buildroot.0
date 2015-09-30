From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 30 Sep 2015 13:52:44 +0200
Subject: [Buildroot] [git commit] git: bump to version 2.6.0
Message-ID: <20150930115301.66879818EC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3cda54971e98c89bed246510969c8c5324ac1e50
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/git/git.hash |    2 +-
 package/git/git.mk   |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/git/git.hash b/package/git/git.hash
index c669d53..5abf518 100644
--- a/package/git/git.hash
+++ b/package/git/git.hash
@@ -1,2 +1,2 @@
 # From: https://www.kernel.org/pub/software/scm/git/sha256sums.asc
-sha256 124d29d857a1282fd2111cf4a021f156e8bae917f455b4551b2aea87f0453a1a  git-2.5.3.tar.xz
+sha256 211beb96ff41a83727e39704431ac388ecb1cebb5219cda067999bce4e1e15a6  git-2.6.0.tar.xz
diff --git a/package/git/git.mk b/package/git/git.mk
index 720528e..43a4397 100644
--- a/package/git/git.mk
+++ b/package/git/git.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GIT_VERSION = 2.5.3
+GIT_VERSION = 2.6.0
 GIT_SOURCE = git-$(GIT_VERSION).tar.xz
 GIT_SITE = https://www.kernel.org/pub/software/scm/git
 GIT_LICENSE = GPLv2 LGPLv2.1+
