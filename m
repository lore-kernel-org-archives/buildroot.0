From: Christopher McCrory <chrismcc@gmail.com>
Date: Fri, 30 Aug 2019 11:40:32 -0700
Subject: [Buildroot] [PATCH] package/vim: bump to version 1929
Message-ID: <20190830184034.26771-1-chrismcc@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Christopher McCrory <chrismcc@gmail.com>
---
 package/vim/vim.hash | 2 +-
 package/vim/vim.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/vim/vim.hash b/package/vim/vim.hash
index 9ec3dd0589..d85bd7760c 100644
--- a/package/vim/vim.hash
+++ b/package/vim/vim.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 a6dab137949097fbe0b67aafedf4c24a3b0d9c41716db35f5beb4834924d7b00  vim-8.1.0133.tar.gz
+sha256 4b7359a58a75c29d4a8fc7fcbb2ccab1d1dc0ede1c4c689b27cc049c17920278 vim-8.1.1929.tar.gz
diff --git a/package/vim/vim.mk b/package/vim/vim.mk
index 5a5408ff6b..5cb4e1b4cc 100644
--- a/package/vim/vim.mk
+++ b/package/vim/vim.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-VIM_VERSION = 8.1.0133
+VIM_VERSION = 8.1.1929
 VIM_SITE = $(call github,vim,vim,v$(VIM_VERSION))
 VIM_DEPENDENCIES = ncurses $(TARGET_NLS_DEPENDENCIES)
 VIM_SUBDIR = src
-- 
2.20.1
