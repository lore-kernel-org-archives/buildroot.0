From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 17 May 2017 22:40:10 +0200
Subject: [Buildroot] [git commit branch/2017.02.x] git: security bump to
	version 2.12.3
Message-ID: <20170517204653.9825B82862@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c554c84ec1c0fab86eef41af63b990ac52b812fb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

Fixes CVE-2017-8386 - Git Shell Bypass By Abusing Less

For more details, see:
https://insinuator.net/2017/05/git-shell-bypass-by-abusing-less-cve-2017-8386/
http://www.mail-archive.com/git at vger.kernel.org/msg120982.html

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
(cherry picked from commit 4a146b933e7ab9c6d1b353f61a610c69bc95bc55)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/git/git.hash | 2 +-
 package/git/git.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/git/git.hash b/package/git/git.hash
index 9af360e..4782dcb 100644
--- a/package/git/git.hash
+++ b/package/git/git.hash
@@ -1,2 +1,2 @@
 # From: https://www.kernel.org/pub/software/scm/git/sha256sums.asc
-sha256 d21a9e23506e618d561fb25a8a7bd6134f927b86147930103487117a7a678c4a  git-2.12.2.tar.xz
+sha256 016124c54ce2db7a4c2bd26b0de21fbf8f6bcaee04842aa221c7243141df4e42  git-2.12.3.tar.xz
diff --git a/package/git/git.mk b/package/git/git.mk
index b49ddd5..04cd577 100644
--- a/package/git/git.mk
+++ b/package/git/git.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GIT_VERSION = 2.12.2
+GIT_VERSION = 2.12.3
 GIT_SOURCE = git-$(GIT_VERSION).tar.xz
 GIT_SITE = https://www.kernel.org/pub/software/scm/git
 GIT_LICENSE = GPLv2, LGPLv2.1+
