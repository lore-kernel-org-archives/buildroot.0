From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Fri, 2 Jun 2017 11:15:36 +0100
Subject: [Buildroot] [PATCH] tmux: bump version to 2.5
Message-ID: <20170602101536.630-1-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/tmux/tmux.hash | 2 +-
 package/tmux/tmux.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/tmux/tmux.hash b/package/tmux/tmux.hash
index ac42571fd..8d82b8076 100644
--- a/package/tmux/tmux.hash
+++ b/package/tmux/tmux.hash
@@ -1,2 +1,2 @@
 # Locally computed:
-sha256 757d6b13231d0d9dd48404968fc114ac09e005d475705ad0cd4b7166f799b349 tmux-2.4.tar.gz
+sha256 ae135ec37c1bf6b7750a84e3a35e93d91033a806943e034521c8af51b12d95df  tmux-2.5.tar.gz
diff --git a/package/tmux/tmux.mk b/package/tmux/tmux.mk
index 6636b9b5f..44ba61352 100644
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
-- 
2.13.0
