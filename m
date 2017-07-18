From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 18 Jul 2017 23:57:18 +0200
Subject: [Buildroot] [git commit] git: bump to version 2.13.3
Message-ID: <20170718215313.0415581732@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cd6069242718fea7781be8ee07fb9baaf228f3a7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add license files hashes.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/git/git.hash | 4 +++-
 package/git/git.mk   | 2 +-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/git/git.hash b/package/git/git.hash
index efe6225..66bb136 100644
--- a/package/git/git.hash
+++ b/package/git/git.hash
@@ -1,2 +1,4 @@
 # From: https://www.kernel.org/pub/software/scm/git/sha256sums.asc
-sha256 4bbf2ab6f2341253a38f95306ec7936833eb1c42572da5c1fa61f0abb2191258  git-2.13.0.tar.xz
+sha256 91aa23be428f67eb19616f43fa0229d567e9acf4f08fba33eb0b627e4d323e62  git-2.13.3.tar.xz
+sha256 5b2198d1645f767585e8a88ac0499b04472164c0d2da22e75ecf97ef443ab32e  COPYING
+sha256 1922f45d2c49e390032c9c0ba6d7cac904087f7cec51af30c2b2ad022ce0e76a  LGPL-2.1
diff --git a/package/git/git.mk b/package/git/git.mk
index 1d81955..d95c2fe 100644
--- a/package/git/git.mk
+++ b/package/git/git.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GIT_VERSION = 2.13.0
+GIT_VERSION = 2.13.3
 GIT_SOURCE = git-$(GIT_VERSION).tar.xz
 GIT_SITE = $(BR2_KERNEL_MIRROR)/software/scm/git
 GIT_LICENSE = GPL-2.0, LGPL-2.1+
