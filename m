From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 19 Dec 2014 15:31:59 -0300
Subject: [Buildroot] [PATCH] git: security bump to version 2.2.1
Message-ID: <1419013919-13603-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
CVE-2014-9390 - arbitrary command execution vulnerability on
case-insensitive file systems.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/git/git.hash | 2 +-
 package/git/git.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/git/git.hash b/package/git/git.hash
index 33fed89..757546d 100644
--- a/package/git/git.hash
+++ b/package/git/git.hash
@@ -1,2 +1,2 @@
 # From: https://www.kernel.org/pub/software/scm/git/sha256sums.asc
-sha256  3b87774672bbf35b4d33991dc5119d4eff47c3679e27185312a2b8b36fdad314  git-2.2.0.tar.xz
+sha256  09422dc9a0bdddf6bdd5b8634c71e1ed3125256c47424e6a2687701e764ef450  git-2.2.1.tar.xz
diff --git a/package/git/git.mk b/package/git/git.mk
index 9e931a1..57737f2 100644
--- a/package/git/git.mk
+++ b/package/git/git.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GIT_VERSION = 2.2.0
+GIT_VERSION = 2.2.1
 GIT_SOURCE = git-$(GIT_VERSION).tar.xz
 GIT_SITE = https://www.kernel.org/pub/software/scm/git
 GIT_LICENSE = GPLv2 LGPLv2.1+
-- 
2.0.4
