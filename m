From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 6 Oct 2015 18:34:59 +0200
Subject: [Buildroot] [git commit] git: bump to version 2.6.1
Message-ID: <20151006163601.F0E3D81EA3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1c25c63a14e4a05eb9b7204174ff672926289e7f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/git/git.hash |    2 +-
 package/git/git.mk   |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/git/git.hash b/package/git/git.hash
index 5abf518..6b663b5 100644
--- a/package/git/git.hash
+++ b/package/git/git.hash
@@ -1,2 +1,2 @@
 # From: https://www.kernel.org/pub/software/scm/git/sha256sums.asc
-sha256 211beb96ff41a83727e39704431ac388ecb1cebb5219cda067999bce4e1e15a6  git-2.6.0.tar.xz
+sha256 fc7c727745d5eb0d796a16dc7c4b999c184830110e0aeb592c788597cc8e9ccd  git-2.6.1.tar.xz
diff --git a/package/git/git.mk b/package/git/git.mk
index 43a4397..2bd6a01 100644
--- a/package/git/git.mk
+++ b/package/git/git.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GIT_VERSION = 2.6.0
+GIT_VERSION = 2.6.1
 GIT_SOURCE = git-$(GIT_VERSION).tar.xz
 GIT_SITE = https://www.kernel.org/pub/software/scm/git
 GIT_LICENSE = GPLv2 LGPLv2.1+
