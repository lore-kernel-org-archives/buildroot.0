From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 29 Sep 2017 09:54:16 +0200
Subject: [Buildroot] [git commit branch/2017.02.x] git: security bump to
	version 2.12.5
Message-ID: <20170929075623.ACA0C80FC1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=de4be78ba178211d0cc39e5b998da9e426b81cf9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

Release notes:
https://public-inbox.org/git/xmqqy3p29ekj.fsf at gitster.mtv.corp.google.com/

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/git/git.hash | 2 +-
 package/git/git.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/git/git.hash b/package/git/git.hash
index b657422..bc81f23 100644
--- a/package/git/git.hash
+++ b/package/git/git.hash
@@ -1,2 +1,2 @@
 # From: https://www.kernel.org/pub/software/scm/git/sha256sums.asc
-sha256 f8b8ac499034e9f6e44e67dd54351bc5654e228e4cd3b55f6f1c8e736c977ce6  git-2.12.4.tar.xz
+sha256 a8c3b3c7dd9202d0e80f824ceb74b4340b60aa8f1ec4ffdde3e982fa5ae16eab  git-2.12.5.tar.xz
diff --git a/package/git/git.mk b/package/git/git.mk
index 94cf7a7..8ce29fc 100644
--- a/package/git/git.mk
+++ b/package/git/git.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GIT_VERSION = 2.12.4
+GIT_VERSION = 2.12.5
 GIT_SOURCE = git-$(GIT_VERSION).tar.xz
 GIT_SITE = https://www.kernel.org/pub/software/scm/git
 GIT_LICENSE = GPLv2, LGPLv2.1+
