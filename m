From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu,  3 Dec 2015 09:57:10 -0300
Subject: [Buildroot] [PATCH] zsh: bump to version 5.2
Message-ID: <1449147430-17234-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/zsh/zsh.hash | 4 ++--
 package/zsh/zsh.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/zsh/zsh.hash b/package/zsh/zsh.hash
index 57c34be..6793162 100644
--- a/package/zsh/zsh.hash
+++ b/package/zsh/zsh.hash
@@ -1,4 +1,4 @@
 # From http://www.zsh.org/pub/MD5SUM
-md5	0e8ea3313300277a04cee80836507bae	zsh-5.1.1.tar.xz
+md5	afe96fde08b70e23c1cab1ca7a68fb34	zsh-5.2.tar.xz
 # Calculated based on the hash above
-sha256	74e9453b5470b3c0970f9f93cfd603d241c3d7b1968adc0e4b3951073e8d3dec	zsh-5.1.1.tar.xz
+sha256	f17916320ffaa844bbd7ce48ceeb5945fc5f3eff64b149b4229bbfbdf3795a9d	zsh-5.2.tar.xz
diff --git a/package/zsh/zsh.mk b/package/zsh/zsh.mk
index 212305b..03456b8 100644
--- a/package/zsh/zsh.mk
+++ b/package/zsh/zsh.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ZSH_VERSION = 5.1.1
+ZSH_VERSION = 5.2
 ZSH_SITE = http://www.zsh.org/pub
 ZSH_SOURCE = zsh-$(ZSH_VERSION).tar.xz
 ZSH_DEPENDENCIES = ncurses
-- 
2.4.10
