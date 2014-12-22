From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 22 Dec 2014 20:19:43 +0200
Subject: [Buildroot] [PATCH 2/2] uemacs: bump to latest version
In-Reply-To: <f4c1a8792a5a65dff7140e427fe1ed9fbca76c5c.1419272383.git.baruch@tkos.co.il>
References: <f4c1a8792a5a65dff7140e427fe1ed9fbca76c5c.1419272383.git.baruch@tkos.co.il>
Message-ID: <7cc1392560e0979610c7de37b0e3e9809648eca2.1419272383.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Adds support for displaying more than 127 lines.

Also, switch to a git tree that carries the latest version.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/uemacs/uemacs.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/uemacs/uemacs.mk b/package/uemacs/uemacs.mk
index 321fbde053e6..19fda124674c 100644
--- a/package/uemacs/uemacs.mk
+++ b/package/uemacs/uemacs.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-UEMACS_VERSION = fa00fe882f719351fdf7a4c4100baf4f3eab4d61
-UEMACS_SITE = $(BR2_KERNEL_MIRROR)/scm/linux/kernel/git/torvalds/uemacs.git
+UEMACS_VERSION = 8841922689769960fa074fbb053cb8507f2f3ed9
+UEMACS_SITE = $(BR2_KERNEL_MIRROR)/scm/editors/uemacs/uemacs.git
 UEMACS_SITE_METHOD = git
 UEMACS_DEPENDENCIES = ncurses
 
-- 
2.1.3
