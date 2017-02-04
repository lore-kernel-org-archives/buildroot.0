From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 4 Feb 2017 13:03:09 +0100
Subject: [Buildroot] [git commit] package/git: bump version to 2.11.1
Message-ID: <20170204162521.9B86E81EEE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=738871e601e9e6d65b8827c9e3e8bf01ecd6a8d4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/git/git.hash | 2 +-
 package/git/git.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/git/git.hash b/package/git/git.hash
index ee76157..07ed47b 100644
--- a/package/git/git.hash
+++ b/package/git/git.hash
@@ -1,2 +1,2 @@
 # From: https://www.kernel.org/pub/software/scm/git/sha256sums.asc
-sha256 7e7e8d69d494892373b87007674be5820a4bc1ef596a0117d03ea3169119fd0b  git-2.11.0.tar.xz
+sha256 c0a779cae325d48a1d5ba08b6ee1febcc31d0657a6da01fd1dec1c6e10976415  git-2.11.1.tar.xz
diff --git a/package/git/git.mk b/package/git/git.mk
index 7d4d363..29e430d 100644
--- a/package/git/git.mk
+++ b/package/git/git.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GIT_VERSION = 2.11.0
+GIT_VERSION = 2.11.1
 GIT_SOURCE = git-$(GIT_VERSION).tar.xz
 GIT_SITE = https://www.kernel.org/pub/software/scm/git
 GIT_LICENSE = GPLv2 LGPLv2.1+
