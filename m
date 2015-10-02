From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri,  2 Oct 2015 13:47:27 -0300
Subject: [Buildroot] [PATCH] zsh: bump to version 5.1.1
Message-ID: <1443804447-17983-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/zsh/zsh.hash | 4 +++-
 package/zsh/zsh.mk   | 3 ++-
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/package/zsh/zsh.hash b/package/zsh/zsh.hash
index 358033f..57c34be 100644
--- a/package/zsh/zsh.hash
+++ b/package/zsh/zsh.hash
@@ -1,2 +1,4 @@
 # From http://www.zsh.org/pub/MD5SUM
-md5	76726ff50309e628de670476e0508b3a	zsh-5.0.7.tar.gz
+md5	0e8ea3313300277a04cee80836507bae	zsh-5.1.1.tar.xz
+# Calculated based on the hash above
+sha256	74e9453b5470b3c0970f9f93cfd603d241c3d7b1968adc0e4b3951073e8d3dec	zsh-5.1.1.tar.xz
diff --git a/package/zsh/zsh.mk b/package/zsh/zsh.mk
index ffc567d..212305b 100644
--- a/package/zsh/zsh.mk
+++ b/package/zsh/zsh.mk
@@ -4,8 +4,9 @@
 #
 ################################################################################
 
-ZSH_VERSION = 5.0.7
+ZSH_VERSION = 5.1.1
 ZSH_SITE = http://www.zsh.org/pub
+ZSH_SOURCE = zsh-$(ZSH_VERSION).tar.xz
 ZSH_DEPENDENCIES = ncurses
 ZSH_CONF_OPTS = --bindir=/bin
 ZSH_LICENSE = MIT-like
-- 
2.4.9
