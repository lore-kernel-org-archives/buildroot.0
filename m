From: Joao Marcos Costa <joaomarcos.costa@bootlin.com>
Date: Mon, 16 Mar 2020 10:44:16 +0100
Subject: [Buildroot] [PATCH] package/vim: bump to v8.2.0
Message-ID: <20200316094416.7274-1-joaomarcos.costa@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Update from version 8.1.1929 to 8.2.0, which is the latest stable
version. The license file ('README.txt') has only one modification,
concerning Vim's version, as it is shown by the following diff:

   --- vim-8.1.1929/README.txt	2019-08-25 23:08:17.000000000 +0200
   +++ vim-8.2.0000/README.txt	2019-12-12 14:18:35.000000000 +0100
   @@ -1,4 +1,4 @@
   -README.txt for version 8.1 of Vim: Vi IMproved.
   +README.txt for version 8.2 of Vim: Vi IMproved.

Signed-off-by: Joao Marcos Costa <joaomarcos.costa@bootlin.com>
---
 package/vim/vim.hash | 4 ++--
 package/vim/vim.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/vim/vim.hash b/package/vim/vim.hash
index 6c68b1bc2b..eb5928e91c 100644
--- a/package/vim/vim.hash
+++ b/package/vim/vim.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  4b7359a58a75c29d4a8fc7fcbb2ccab1d1dc0ede1c4c689b27cc049c17920278  vim-8.1.1929.tar.gz
-sha256  70ab7f93197b29d47bfe4371774c8d904f7842d4843c257d21c29b7ac38d6406  README.txt
+sha256  8a72323817210daf40abe545bdf7637591b9b541a0fb3560baed76e436132dba  vim-8.2.0000.tar.gz
+sha256  accdbd6761e7dd7e580545fe30f3a5a7707d50073aec4b8afef85c30fc9c031b  README.txt
diff --git a/package/vim/vim.mk b/package/vim/vim.mk
index 5cb4e1b4cc..1fbb6a6b86 100644
--- a/package/vim/vim.mk
+++ b/package/vim/vim.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-VIM_VERSION = 8.1.1929
+VIM_VERSION = 8.2.0000
 VIM_SITE = $(call github,vim,vim,v$(VIM_VERSION))
 VIM_DEPENDENCIES = ncurses $(TARGET_NLS_DEPENDENCIES)
 VIM_SUBDIR = src
-- 
2.17.1
