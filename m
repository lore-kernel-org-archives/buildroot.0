From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 30 Aug 2014 09:02:00 +0200
Subject: [Buildroot] [git commit branch/next] zsh: bump to version 5.0.6
Message-ID: <20140830071153.4199C9D546@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=76eee8c6ab3e684f680c8d199f4024ce6b38c53a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/zsh/zsh.mk |    3 +--
 1 files changed, 1 insertions(+), 2 deletions(-)

diff --git a/package/zsh/zsh.mk b/package/zsh/zsh.mk
index 8bd2fb0..f4daeeb 100644
--- a/package/zsh/zsh.mk
+++ b/package/zsh/zsh.mk
@@ -4,11 +4,10 @@
 #
 ################################################################################
 
-ZSH_VERSION = 5.0.5
+ZSH_VERSION = 5.0.6
 ZSH_SITE = http://downloads.sourceforge.net/project/zsh/zsh/$(ZSH_VERSION)
 ZSH_LICENSE = MIT-like
 ZSH_LICENSE_FILES = LICENCE
-
 ZSH_DEPENDENCIES = ncurses
 
 $(eval $(autotools-package))
