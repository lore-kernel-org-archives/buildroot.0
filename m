From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun,  5 Jun 2016 19:52:09 +0200
Subject: [Buildroot] [PATCH 16/28] package/vim: bump version to v7.4.1902
In-Reply-To: <1465149141-15774-1-git-send-email-bernd.kuhls@t-online.de>
References: <1465149141-15774-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1465149141-15774-16-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/vim/vim.mk | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/vim/vim.mk b/package/vim/vim.mk
index 6e05050..c2f6cac 100644
--- a/package/vim/vim.mk
+++ b/package/vim/vim.mk
@@ -4,8 +4,7 @@
 #
 ################################################################################
 
-# 7.4 release patchlevel 889
-VIM_VERSION = 74b738d414b2895b3365e26ae3b7792eb82ccf47
+VIM_VERSION = v7.4.1902
 VIM_SITE = $(call github,vim,vim,$(VIM_VERSION))
 # Win over busybox vi since vim is more feature-rich
 VIM_DEPENDENCIES = \
-- 
2.8.1
