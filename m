From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 30 Nov 2016 11:59:27 +0100
Subject: [Buildroot] [git commit] git: bump version to 2.11.0
Message-ID: <20161201222141.023A48026C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a8ab83fada243a14bb0e0c3966b69900f264996b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/git/git.hash | 2 +-
 package/git/git.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/git/git.hash b/package/git/git.hash
index 0815641..ee76157 100644
--- a/package/git/git.hash
+++ b/package/git/git.hash
@@ -1,2 +1,2 @@
 # From: https://www.kernel.org/pub/software/scm/git/sha256sums.asc
-sha256 94802903dd707d85ca3b9a2be35e936a54ce86375f52c6a789efe7ce7e238671  git-2.10.2.tar.xz
+sha256 7e7e8d69d494892373b87007674be5820a4bc1ef596a0117d03ea3169119fd0b  git-2.11.0.tar.xz
diff --git a/package/git/git.mk b/package/git/git.mk
index a7768ac..7d4d363 100644
--- a/package/git/git.mk
+++ b/package/git/git.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GIT_VERSION = 2.10.2
+GIT_VERSION = 2.11.0
 GIT_SOURCE = git-$(GIT_VERSION).tar.xz
 GIT_SITE = https://www.kernel.org/pub/software/scm/git
 GIT_LICENSE = GPLv2 LGPLv2.1+
