From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 28 Jan 2018 09:40:49 +0100
Subject: [Buildroot] [PATCH 1/1] package/git: bump version to 2.16.1
Message-ID: <20180128084049.2956-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/git/git.hash | 2 +-
 package/git/git.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/git/git.hash b/package/git/git.hash
index 79a386eb72..504f7d993a 100644
--- a/package/git/git.hash
+++ b/package/git/git.hash
@@ -1,4 +1,4 @@
 # From: https://www.kernel.org/pub/software/scm/git/sha256sums.asc
-sha256 107116489f10b758b51af1c5dbdb9a274917b0fb67dc8eaefcdabc7bc3eb3e6a  git-2.15.0.tar.xz
+sha256 cfad4337f2fdbfc1e2c8abce5e17e1dd4e1718a34ac2cbe3238fbe2426f2ea19  git-2.16.1.tar.xz
 sha256 5b2198d1645f767585e8a88ac0499b04472164c0d2da22e75ecf97ef443ab32e  COPYING
 sha256 1922f45d2c49e390032c9c0ba6d7cac904087f7cec51af30c2b2ad022ce0e76a  LGPL-2.1
diff --git a/package/git/git.mk b/package/git/git.mk
index 6269dc570e..1109f7a8a2 100644
--- a/package/git/git.mk
+++ b/package/git/git.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GIT_VERSION = 2.15.0
+GIT_VERSION = 2.16.1
 GIT_SOURCE = git-$(GIT_VERSION).tar.xz
 GIT_SITE = $(BR2_KERNEL_MIRROR)/software/scm/git
 GIT_LICENSE = GPL-2.0, LGPL-2.1+
-- 
2.11.0
