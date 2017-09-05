From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 6 Sep 2017 00:08:18 +0200
Subject: [Buildroot] [git commit branch/2017.02.x] package/git: security
	bump to version 2.12.4
Message-ID: <20170905220139.2789B80466@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=19d178a5cb9599e1899398fe3e191a4ba1e8a09a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

Fixes CVE-2017-1000117:
http://www.mail-archive.com/linux-kernel at vger.kernel.org/msg1466490.html

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/git/git.hash | 2 +-
 package/git/git.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/git/git.hash b/package/git/git.hash
index 4782dcb..b657422 100644
--- a/package/git/git.hash
+++ b/package/git/git.hash
@@ -1,2 +1,2 @@
 # From: https://www.kernel.org/pub/software/scm/git/sha256sums.asc
-sha256 016124c54ce2db7a4c2bd26b0de21fbf8f6bcaee04842aa221c7243141df4e42  git-2.12.3.tar.xz
+sha256 f8b8ac499034e9f6e44e67dd54351bc5654e228e4cd3b55f6f1c8e736c977ce6  git-2.12.4.tar.xz
diff --git a/package/git/git.mk b/package/git/git.mk
index 04cd577..94cf7a7 100644
--- a/package/git/git.mk
+++ b/package/git/git.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GIT_VERSION = 2.12.3
+GIT_VERSION = 2.12.4
 GIT_SOURCE = git-$(GIT_VERSION).tar.xz
 GIT_SITE = https://www.kernel.org/pub/software/scm/git
 GIT_LICENSE = GPLv2, LGPLv2.1+
