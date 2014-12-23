From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 23 Dec 2014 11:33:50 +0100
Subject: [Buildroot] [git commit] uemacs: bump to latest version
Message-ID: <20141223103354.D545E805F8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=95d5c3939154c507f761b88b6918994540bc1014
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Adds support for displaying more than 127 lines.

Also, switch to a git tree that carries the latest version.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/uemacs/uemacs.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/uemacs/uemacs.mk b/package/uemacs/uemacs.mk
index 321fbde..19fda12 100644
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
 
