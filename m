From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Mon, 27 Apr 2020 11:58:53 -0500
Subject: [Buildroot] [PATCH] package/git: bump to 2.26.2
Message-ID: <20200427165853.17316-1-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
---
 package/git/git.hash | 2 +-
 package/git/git.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/git/git.hash b/package/git/git.hash
index 04e6002cd1..eb7e52ebde 100644
--- a/package/git/git.hash
+++ b/package/git/git.hash
@@ -1,4 +1,4 @@
 # From: https://www.kernel.org/pub/software/scm/git/sha256sums.asc
-sha256  888228408f254634330234df3cece734d190ef6381063821f31ec020538f0368  git-2.26.1.tar.xz
 sha256  5b2198d1645f767585e8a88ac0499b04472164c0d2da22e75ecf97ef443ab32e  COPYING
 sha256  1922f45d2c49e390032c9c0ba6d7cac904087f7cec51af30c2b2ad022ce0e76a  LGPL-2.1
+sha256  6d65132471df9e531807cb2746f8be317e22a343b9385bbe11c9ce7f0d2fc848  git-2.26.2.tar.xz
diff --git a/package/git/git.mk b/package/git/git.mk
index 446f035fec..0a67a7e1e2 100644
--- a/package/git/git.mk
+++ b/package/git/git.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GIT_VERSION = 2.26.1
+GIT_VERSION = 2.26.2
 GIT_SOURCE = git-$(GIT_VERSION).tar.xz
 GIT_SITE = $(BR2_KERNEL_MIRROR)/software/scm/git
 GIT_LICENSE = GPL-2.0, LGPL-2.1+
-- 
2.17.1
