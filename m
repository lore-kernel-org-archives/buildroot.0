From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 22 Jul 2016 20:39:08 -0300
Subject: [Buildroot] [PATCH] unrar: bump to version 5.4.3
Message-ID: <1469230748-5146-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/unrar/unrar.hash | 2 +-
 package/unrar/unrar.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/unrar/unrar.hash b/package/unrar/unrar.hash
index 4490d70..e6a146c 100644
--- a/package/unrar/unrar.hash
+++ b/package/unrar/unrar.hash
@@ -1,2 +1,2 @@
 # Locally computed:
-sha256	ff593728aed0ac865908b8ea52cff449a4c298f095db2f3d27438ffbc3e35d5b	unrarsrc-5.3.9.tar.gz
+sha256	e4f05190d9e379449a04c22baffc24cc2f03164a4738befe601b1325440db0c6	unrarsrc-5.4.3.tar.gz
diff --git a/package/unrar/unrar.mk b/package/unrar/unrar.mk
index 89dff9b..e49fe6c 100644
--- a/package/unrar/unrar.mk
+++ b/package/unrar/unrar.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UNRAR_VERSION = 5.3.9
+UNRAR_VERSION = 5.4.3
 UNRAR_SOURCE = unrarsrc-$(UNRAR_VERSION).tar.gz
 UNRAR_SITE = http://www.rarlab.com/rar
 UNRAR_LICENSE = unrar
-- 
2.7.3
