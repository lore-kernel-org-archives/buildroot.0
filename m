From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 18 Sep 2018 22:51:05 +0200
Subject: [Buildroot] [git commit] zsh: bump to version 5.6.2
Message-ID: <20180918205403.432F988590@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6c6bedf9edf0a71d9f6bbc5e378d2ebcc6c06e48
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/zsh/zsh.hash | 6 +++---
 package/zsh/zsh.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/zsh/zsh.hash b/package/zsh/zsh.hash
index 5931e4d465..4363e48afe 100644
--- a/package/zsh/zsh.hash
+++ b/package/zsh/zsh.hash
@@ -1,7 +1,7 @@
 # From http://www.zsh.org/pub/MD5SUM
-md5	5c3b294e63b6cc8da8bcc364c72d954b	zsh-5.5.tar.xz
+md5	540673bf823d2e13806ac0395caa8345	zsh-5.6.2.tar.xz
 # Calculated based on the hash above and after checking signature
-# http://www.zsh.org/pub/zsh-5.5.tar.xz.asc
-sha256	a8359b81d090425d497c6f3c724a7c21a81c614b03e7662ed347705d86958e53	zsh-5.5.tar.xz
+# http://www.zsh.org/pub/zsh-5.6.2.tar.xz.asc
+sha256	a50bd66c0557e8eca3b8fa24e85d0de533e775d7a22df042da90488623752e9e	zsh-5.6.2.tar.xz
 # Locally calculated
 sha256	d06fdf3ef9b1ec69d6b9e170b0a9516fbad3523261ff1668bde3bfea6e0ef5f5  LICENCE
diff --git a/package/zsh/zsh.mk b/package/zsh/zsh.mk
index e798838922..31c9405007 100644
--- a/package/zsh/zsh.mk
+++ b/package/zsh/zsh.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ZSH_VERSION = 5.5
+ZSH_VERSION = 5.6.2
 ZSH_SITE = http://www.zsh.org/pub
 ZSH_SOURCE = zsh-$(ZSH_VERSION).tar.xz
 ZSH_DEPENDENCIES = ncurses
