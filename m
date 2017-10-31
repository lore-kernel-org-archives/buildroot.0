From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 31 Oct 2017 15:32:17 +0200
Subject: [Buildroot] [PATCH] tmux: bump to version 2.6
Message-ID: <4a27f29cd16985d21b2931e3502561ecb1cc22f7.1509456737.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add license file hash.

Cc: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/tmux/tmux.hash | 3 ++-
 package/tmux/tmux.mk   | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/tmux/tmux.hash b/package/tmux/tmux.hash
index 8d82b8076ac6..752bbb45164f 100644
--- a/package/tmux/tmux.hash
+++ b/package/tmux/tmux.hash
@@ -1,2 +1,3 @@
 # Locally computed:
-sha256 ae135ec37c1bf6b7750a84e3a35e93d91033a806943e034521c8af51b12d95df  tmux-2.5.tar.gz
+sha256 b17cd170a94d7b58c0698752e1f4f263ab6dc47425230df7e53a6435cc7cd7e8  tmux-2.6.tar.gz
+sha256 94e2b1feb1202d3308cc7ab7ec42278d24f10562394bdf269f44649327c8198f  README
diff --git a/package/tmux/tmux.mk b/package/tmux/tmux.mk
index 44ba613522fe..6e03d01abfca 100644
--- a/package/tmux/tmux.mk
+++ b/package/tmux/tmux.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TMUX_VERSION = 2.5
+TMUX_VERSION = 2.6
 TMUX_SITE = https://github.com/tmux/tmux/releases/download/$(TMUX_VERSION)
 TMUX_LICENSE = ISC
 TMUX_LICENSE_FILES = README
-- 
2.14.2
