From: Peter Seiderer <ps.report@gmx.net>
Date: Sun, 10 Jan 2021 23:36:48 +0100
Subject: [Buildroot] [PATCH v1] package/git: bump version to 2.30.0
Message-ID: <20210110223648.18216-1-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

For details see [1].

[1] http://lkml.iu.edu/hypermail/linux/kernel/2012.3/03301.html

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/git/git.hash | 2 +-
 package/git/git.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/git/git.hash b/package/git/git.hash
index 87547b4ac0..375ce787e9 100644
--- a/package/git/git.hash
+++ b/package/git/git.hash
@@ -1,5 +1,5 @@
 # From: https://www.kernel.org/pub/software/scm/git/sha256sums.asc
-sha256  f2fc436ebe657821a1360bcd1e5f4896049610082419143d60f6fa13c2f607c1  git-2.29.2.tar.xz
+sha256  55735021109565721af805af382c45cce73c3cfaa59daad22443d1477d334d19  git-2.30.0.tar.xz
 # Locally calculated
 sha256  5b2198d1645f767585e8a88ac0499b04472164c0d2da22e75ecf97ef443ab32e  COPYING
 sha256  1922f45d2c49e390032c9c0ba6d7cac904087f7cec51af30c2b2ad022ce0e76a  LGPL-2.1
diff --git a/package/git/git.mk b/package/git/git.mk
index 6a15e3aeeb..8121add711 100644
--- a/package/git/git.mk
+++ b/package/git/git.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GIT_VERSION = 2.29.2
+GIT_VERSION = 2.30.0
 GIT_SOURCE = git-$(GIT_VERSION).tar.xz
 GIT_SITE = $(BR2_KERNEL_MIRROR)/software/scm/git
 GIT_LICENSE = GPL-2.0, LGPL-2.1+
-- 
2.29.2
