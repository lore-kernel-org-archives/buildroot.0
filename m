From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 15 Sep 2019 21:46:14 +0200
Subject: [Buildroot] [git commit] package/zsh: bump to version 5.7.1
Message-ID: <20190915194200.B951E8E59B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=beb8f1274ddc4689930bd037dd1231778680532c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Christopher McCrory <chrismcc@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/zsh/zsh.hash | 6 +++---
 package/zsh/zsh.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/zsh/zsh.hash b/package/zsh/zsh.hash
index 4363e48afe..79c661d455 100644
--- a/package/zsh/zsh.hash
+++ b/package/zsh/zsh.hash
@@ -1,7 +1,7 @@
 # From http://www.zsh.org/pub/MD5SUM
-md5	540673bf823d2e13806ac0395caa8345	zsh-5.6.2.tar.xz
+md5	374f9fdd121b5b90e07abfcad7df0627	zsh-5.7.1.tar.xz
 # Calculated based on the hash above and after checking signature
-# http://www.zsh.org/pub/zsh-5.6.2.tar.xz.asc
-sha256	a50bd66c0557e8eca3b8fa24e85d0de533e775d7a22df042da90488623752e9e	zsh-5.6.2.tar.xz
+# http://www.zsh.org/pub/zsh-5.7.1.tar.xz.asc
+sha256 7260292c2c1d483b2d50febfa5055176bd512b32a8833b116177bf5f01e77ee8 zsh-5.7.1.tar.xz
 # Locally calculated
 sha256	d06fdf3ef9b1ec69d6b9e170b0a9516fbad3523261ff1668bde3bfea6e0ef5f5  LICENCE
diff --git a/package/zsh/zsh.mk b/package/zsh/zsh.mk
index 31c9405007..b287e3051d 100644
--- a/package/zsh/zsh.mk
+++ b/package/zsh/zsh.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ZSH_VERSION = 5.6.2
+ZSH_VERSION = 5.7.1
 ZSH_SITE = http://www.zsh.org/pub
 ZSH_SOURCE = zsh-$(ZSH_VERSION).tar.xz
 ZSH_DEPENDENCIES = ncurses
