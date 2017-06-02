From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 2 Jun 2017 13:30:49 +0200
Subject: [Buildroot] [git commit] tmux: bump version to 2.5
Message-ID: <20170602113407.DD52882A57@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bb019e4473c8ac02ea491d20f6073e665d4579f6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/tmux/tmux.hash | 2 +-
 package/tmux/tmux.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/tmux/tmux.hash b/package/tmux/tmux.hash
index ac42571..8d82b80 100644
--- a/package/tmux/tmux.hash
+++ b/package/tmux/tmux.hash
@@ -1,2 +1,2 @@
 # Locally computed:
-sha256 757d6b13231d0d9dd48404968fc114ac09e005d475705ad0cd4b7166f799b349 tmux-2.4.tar.gz
+sha256 ae135ec37c1bf6b7750a84e3a35e93d91033a806943e034521c8af51b12d95df  tmux-2.5.tar.gz
diff --git a/package/tmux/tmux.mk b/package/tmux/tmux.mk
index 6636b9b..44ba613 100644
--- a/package/tmux/tmux.mk
+++ b/package/tmux/tmux.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TMUX_VERSION = 2.4
+TMUX_VERSION = 2.5
 TMUX_SITE = https://github.com/tmux/tmux/releases/download/$(TMUX_VERSION)
 TMUX_LICENSE = ISC
 TMUX_LICENSE_FILES = README
