From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 7 Oct 2018 21:52:37 +0200
Subject: [Buildroot] [git commit] git: security bump to version 2.16.5
Message-ID: <20181007195140.497268E02C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=063eff9bc622b223530e7a2a83a45f7adb5c7d6d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes CVE-2018-17456: RCE issue in handling of git submodules

For more details, see the announcement:
https://marc.info/?l=git&m=153875888916397&w=2

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/git/git.hash | 2 +-
 package/git/git.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/git/git.hash b/package/git/git.hash
index 4bcc5ee5d3..35c8774d75 100644
--- a/package/git/git.hash
+++ b/package/git/git.hash
@@ -1,4 +1,4 @@
 # From: https://www.kernel.org/pub/software/scm/git/sha256sums.asc
-sha256 6e69b0e9c487e5da52a14d4829f0b6a28b2c18a0bb6fb67c0dc8b5b5658bd532  git-2.16.4.tar.xz
+sha256 dfb71b053cbc38a9c5b08c2fe8b5eae210b4e3b63892426923e10cfd6ba63862  git-2.16.5.tar.xz
 sha256 5b2198d1645f767585e8a88ac0499b04472164c0d2da22e75ecf97ef443ab32e  COPYING
 sha256 1922f45d2c49e390032c9c0ba6d7cac904087f7cec51af30c2b2ad022ce0e76a  LGPL-2.1
diff --git a/package/git/git.mk b/package/git/git.mk
index ac7b8f2e8c..9b176d3661 100644
--- a/package/git/git.mk
+++ b/package/git/git.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GIT_VERSION = 2.16.4
+GIT_VERSION = 2.16.5
 GIT_SOURCE = git-$(GIT_VERSION).tar.xz
 GIT_SITE = $(BR2_KERNEL_MIRROR)/software/scm/git
 GIT_LICENSE = GPL-2.0, LGPL-2.1+
