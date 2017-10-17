From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 17 Oct 2017 10:33:39 +0200
Subject: [Buildroot] [git commit branch/2017.08.x] package/git: security
	bump to version 2.13.6
Message-ID: <20171017090325.E130F81190@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=81898124e65a69edc482c8968c1f1525804fc885
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.08.x

Release notes:
https://public-inbox.org/git/xmqqy3p29ekj.fsf at gitster.mtv.corp.google.com/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
(cherry picked from commit 8e0c7ce50b97518fd3aa088867213af2a4917917)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/git/git.hash | 2 +-
 package/git/git.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/git/git.hash b/package/git/git.hash
index 8aa0503..d65296f 100644
--- a/package/git/git.hash
+++ b/package/git/git.hash
@@ -1,4 +1,4 @@
 # From: https://www.kernel.org/pub/software/scm/git/sha256sums.asc
-sha256 21c9e29caac86d244ac7af78bc3422746dabb903cb3952a1ceefd801020ad1a1  git-2.13.5.tar.xz
+sha256 bce97e403bea34f50378e90ade10c12666b2382cc247551b63dc5604e03b2523  git-2.13.6.tar.xz
 sha256 5b2198d1645f767585e8a88ac0499b04472164c0d2da22e75ecf97ef443ab32e  COPYING
 sha256 1922f45d2c49e390032c9c0ba6d7cac904087f7cec51af30c2b2ad022ce0e76a  LGPL-2.1
diff --git a/package/git/git.mk b/package/git/git.mk
index fe4d553..9f13f0f 100644
--- a/package/git/git.mk
+++ b/package/git/git.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GIT_VERSION = 2.13.5
+GIT_VERSION = 2.13.6
 GIT_SOURCE = git-$(GIT_VERSION).tar.xz
 GIT_SITE = $(BR2_KERNEL_MIRROR)/software/scm/git
 GIT_LICENSE = GPL-2.0, LGPL-2.1+
