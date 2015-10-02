From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 2 Oct 2015 21:06:05 +0200
Subject: [Buildroot] [git commit] zsh: bump to version 5.1.1
Message-ID: <20151002190617.B61F881D88@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6d5d7b33945c343a12f1c8c12f1cd360e2897823
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/zsh/zsh.hash |    4 +++-
 package/zsh/zsh.mk   |    3 ++-
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
