From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Fri, 11 Oct 2019 00:08:38 -0300
Subject: [Buildroot] [PATCH 1/2] package/tmux: bump to version 2.9a
Message-ID: <20191011030839.15308-1-ricardo.martincoski@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This is a bug fix release.
Changelog: https://raw.githubusercontent.com/tmux/tmux/2.9a/CHANGES

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Cc: Yann E. MORIN <yann.morin.1998@free.fr>
---
./utils/test-pkg -a -p tmux
44 builds, 4 skipped, 0 build failed, 0 legal-info failed
---
 package/tmux/tmux.hash | 2 +-
 package/tmux/tmux.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/tmux/tmux.hash b/package/tmux/tmux.hash
index 81a6306807..e27fca253d 100644
--- a/package/tmux/tmux.hash
+++ b/package/tmux/tmux.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256 34901232f486fd99f3a39e864575e658b5d49f43289ccc6ee57c365f2e2c2980  tmux-2.9.tar.gz
+sha256 839d167a4517a6bffa6b6074e89a9a8630547b2dea2086f1fad15af12ab23b25  tmux-2.9a.tar.gz
 sha256 ce75f1345a76c93bd0f413d1b93ff1baa0669f34a7242779a00c1b862b4f813a  COPYING
diff --git a/package/tmux/tmux.mk b/package/tmux/tmux.mk
index 596cf54be1..169c9bb83f 100644
--- a/package/tmux/tmux.mk
+++ b/package/tmux/tmux.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TMUX_VERSION = 2.9
+TMUX_VERSION = 2.9a
 TMUX_SITE = https://github.com/tmux/tmux/releases/download/$(TMUX_VERSION)
 TMUX_LICENSE = ISC
 TMUX_LICENSE_FILES = COPYING
-- 
2.17.1
