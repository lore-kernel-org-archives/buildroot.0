From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 5 Jun 2016 21:56:19 +0200
Subject: [Buildroot] [git commit] package/vim: bump version to v7.4.1902
Message-ID: <20160605200530.89FEC81E84@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=02a6f26ededdaf8333f942aa0b6ace74284473af
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
