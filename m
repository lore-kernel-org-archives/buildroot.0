From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 2 Apr 2018 15:45:02 +0200
Subject: [Buildroot] [git commit] package/git: bump version to 2.16.3
Message-ID: <20180402134524.03B2B82A57@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9447e866187728009addf0cc62aa0c6b293b6dcd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/git/git.hash | 2 +-
 package/git/git.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/git/git.hash b/package/git/git.hash
index 504f7d993a..fea1a1e904 100644
--- a/package/git/git.hash
+++ b/package/git/git.hash
@@ -1,4 +1,4 @@
 # From: https://www.kernel.org/pub/software/scm/git/sha256sums.asc
-sha256 cfad4337f2fdbfc1e2c8abce5e17e1dd4e1718a34ac2cbe3238fbe2426f2ea19  git-2.16.1.tar.xz
+sha256 d65d99e9e5b081c1f14ea018973806e942a2eb7d0da2ebc01bd2525adee62d48  git-2.16.3.tar.xz
 sha256 5b2198d1645f767585e8a88ac0499b04472164c0d2da22e75ecf97ef443ab32e  COPYING
 sha256 1922f45d2c49e390032c9c0ba6d7cac904087f7cec51af30c2b2ad022ce0e76a  LGPL-2.1
diff --git a/package/git/git.mk b/package/git/git.mk
index 1109f7a8a2..2115e04e31 100644
--- a/package/git/git.mk
+++ b/package/git/git.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GIT_VERSION = 2.16.1
+GIT_VERSION = 2.16.3
 GIT_SOURCE = git-$(GIT_VERSION).tar.xz
 GIT_SITE = $(BR2_KERNEL_MIRROR)/software/scm/git
 GIT_LICENSE = GPL-2.0, LGPL-2.1+
