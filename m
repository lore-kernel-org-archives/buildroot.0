From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri, 10 Apr 2020 23:22:16 +0200
Subject: [Buildroot] [PATCH 1/1] package/git: bump to version 2.26.0
Message-ID: <20200410212216.751604-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Update indentation of hash file (two spaces)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/git/git.hash | 6 +++---
 package/git/git.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/git/git.hash b/package/git/git.hash
index 74bf334b78..d4a0a90e51 100644
--- a/package/git/git.hash
+++ b/package/git/git.hash
@@ -1,4 +1,4 @@
 # From: https://www.kernel.org/pub/software/scm/git/sha256sums.asc
-sha256 723f24dce8fdd621a308b6187553fce7d5244205c065fe0a3aebd0b7c3f88562  git-2.24.1.tar.xz
-sha256 5b2198d1645f767585e8a88ac0499b04472164c0d2da22e75ecf97ef443ab32e  COPYING
-sha256 1922f45d2c49e390032c9c0ba6d7cac904087f7cec51af30c2b2ad022ce0e76a  LGPL-2.1
+sha256  9ece0dcb07a5e0d7366a92b613b201cca11ae368ab7687041364b3e756e495d6  git-2.26.0.tar.xz
+sha256  5b2198d1645f767585e8a88ac0499b04472164c0d2da22e75ecf97ef443ab32e  COPYING
+sha256  1922f45d2c49e390032c9c0ba6d7cac904087f7cec51af30c2b2ad022ce0e76a  LGPL-2.1
diff --git a/package/git/git.mk b/package/git/git.mk
index dd79c41e4a..f70a42da85 100644
--- a/package/git/git.mk
+++ b/package/git/git.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GIT_VERSION = 2.24.1
+GIT_VERSION = 2.26.0
 GIT_SOURCE = git-$(GIT_VERSION).tar.xz
 GIT_SITE = $(BR2_KERNEL_MIRROR)/software/scm/git
 GIT_LICENSE = GPL-2.0, LGPL-2.1+
-- 
2.25.1
