From: =?UTF-8?q?Arnaud=20R=C3=A9billout?= <rebillout@syscom.ch>
Date: Thu, 31 Oct 2013 11:39:48 +0100
Subject: [Buildroot] [PATCH] uemacs: fix package source
Message-ID: <1383215988-28993-1-git-send-email-rebillout@syscom.ch>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

There is no bz2 archive for uemacs on kernel.org, only a gz archive.

Signed-off-by: Arnaud R?billout <rebillout@syscom.ch>
---
 package/uemacs/uemacs.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/uemacs/uemacs.mk b/package/uemacs/uemacs.mk
index 9452062..0cd38e0 100644
--- a/package/uemacs/uemacs.mk
+++ b/package/uemacs/uemacs.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 UEMACS_VERSION = 4.0.15-lt
-UEMACS_SOURCE = em-$(UEMACS_VERSION).tar.bz2
+UEMACS_SOURCE = em-$(UEMACS_VERSION).tar.gz
 UEMACS_SITE = $(BR2_KERNEL_MIRROR)/software/editors/uemacs/
 UEMACS_DEPENDENCIES = ncurses
 
-- 
1.8.4.rc3
