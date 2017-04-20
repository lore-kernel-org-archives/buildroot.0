From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 20 Apr 2017 15:33:52 +0300
Subject: [Buildroot] [PATCH] zsh: bump to version 5.3.1
Message-ID: <030236122406c9e436467c40fd5ce4eb4c9d254b.1492691632.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Cc: Phil Eichinger <phil.eichinger@gmail.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/zsh/zsh.hash | 6 +++---
 package/zsh/zsh.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/zsh/zsh.hash b/package/zsh/zsh.hash
index 0eeebd43f4b8..9c6acf336ff3 100644
--- a/package/zsh/zsh.hash
+++ b/package/zsh/zsh.hash
@@ -1,4 +1,4 @@
 # From http://www.zsh.org/pub/MD5SUM
-md5	c5ba34e68fcf62a2e78adc56bf3d328a	zsh-5.3.tar.xz
-# Calculated based on the hash above
-sha256	76f82cfd5ce373cf799a03b6f395283f128430db49202e3e3f512fb5a19d6f8a	zsh-5.3.tar.xz
+md5	67d3e5ed99de68340c16aef613b0ecf7	zsh-5.3.1.tar.xz
+# Calculated based on the hash above and after checking signature
+sha256	fc886cb2ade032d006da8322c09a7e92b2309177811428b121192d44832920da	zsh-5.3.1.tar.xz
diff --git a/package/zsh/zsh.mk b/package/zsh/zsh.mk
index 9d11b9713df0..779114e5ea38 100644
--- a/package/zsh/zsh.mk
+++ b/package/zsh/zsh.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ZSH_VERSION = 5.3
+ZSH_VERSION = 5.3.1
 ZSH_SITE = http://www.zsh.org/pub
 ZSH_SOURCE = zsh-$(ZSH_VERSION).tar.xz
 ZSH_DEPENDENCIES = ncurses
-- 
2.11.0
