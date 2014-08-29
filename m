From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 29 Aug 2014 08:08:37 -0300
Subject: [Buildroot] [PATCH] zsh: bump to version 5.0.6
Message-ID: <1409310517-32635-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/zsh/zsh.mk | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

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
-- 
1.8.5.5
