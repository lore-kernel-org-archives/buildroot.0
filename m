From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 31 Oct 2017 20:11:56 +0100
Subject: [Buildroot] [git commit] tmux: bump to version 2.6
Message-ID: <20171031190547.D7D27811FB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d69946cd225abfc4724d46ec28178ea7fc5bed4a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add license file hash.

Cc: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/tmux/tmux.hash | 3 ++-
 package/tmux/tmux.mk   | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/tmux/tmux.hash b/package/tmux/tmux.hash
index 8d82b80..752bbb4 100644
--- a/package/tmux/tmux.hash
+++ b/package/tmux/tmux.hash
@@ -1,2 +1,3 @@
 # Locally computed:
-sha256 ae135ec37c1bf6b7750a84e3a35e93d91033a806943e034521c8af51b12d95df  tmux-2.5.tar.gz
+sha256 b17cd170a94d7b58c0698752e1f4f263ab6dc47425230df7e53a6435cc7cd7e8  tmux-2.6.tar.gz
+sha256 94e2b1feb1202d3308cc7ab7ec42278d24f10562394bdf269f44649327c8198f  README
diff --git a/package/tmux/tmux.mk b/package/tmux/tmux.mk
index 44ba613..6e03d01 100644
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
