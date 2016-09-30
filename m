From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Fri, 30 Sep 2016 10:14:34 +0100
Subject: [Buildroot] [PATCH] tmux: bump version to 2.3
Message-ID: <20160930091434.27396-1-Vincent.Riera@imgtec.com>
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
index f3cbe74..9195a16 100644
--- a/package/tmux/tmux.hash
+++ b/package/tmux/tmux.hash
@@ -1,2 +1,2 @@
 # Locally computed:
-sha256  bc28541b64f99929fe8e3ae7a02291263f3c97730781201824c0f05d7c8e19e4  tmux-2.2.tar.gz
+sha256 55313e132f0f42de7e020bf6323a1939ee02ab79c48634aa07475db41573852b  tmux-2.3.tar.gz
diff --git a/package/tmux/tmux.mk b/package/tmux/tmux.mk
index 1e1b2b7..f6dd1a9 100644
--- a/package/tmux/tmux.mk
+++ b/package/tmux/tmux.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TMUX_VERSION = 2.2
+TMUX_VERSION = 2.3
 TMUX_SITE = https://github.com/tmux/tmux/releases/download/$(TMUX_VERSION)
 TMUX_LICENSE = ISC
 TMUX_LICENSE_FILES = README
-- 
2.10.0
