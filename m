From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 13 Oct 2016 08:01:55 +0200
Subject: [Buildroot] [git commit] git: bump version to 2.10.1
Message-ID: <20161013060801.D1BB882269@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=917bf769db061995667abfc7a4ae36e79cc2a546
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/git/git.hash | 2 +-
 package/git/git.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/git/git.hash b/package/git/git.hash
index e2cf300..73bb9cb 100644
--- a/package/git/git.hash
+++ b/package/git/git.hash
@@ -1,2 +1,2 @@
 # From: https://www.kernel.org/pub/software/scm/git/sha256sums.asc
-sha256 c73364ac00ae85ffc6cfb12ca2700bb0edf30f63262be97be4039be594ff29e7  git-2.10.0.tar.xz
+sha256 a9c32df9061cfc2c194ecaa0357ba273c1f24a0dbf0d856b03dcedafcd0a4dc6  git-2.10.1.tar.xz
diff --git a/package/git/git.mk b/package/git/git.mk
index 3730b77..8bc2907 100644
--- a/package/git/git.mk
+++ b/package/git/git.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GIT_VERSION = 2.10.0
+GIT_VERSION = 2.10.1
 GIT_SOURCE = git-$(GIT_VERSION).tar.xz
 GIT_SITE = https://www.kernel.org/pub/software/scm/git
 GIT_LICENSE = GPLv2 LGPLv2.1+
