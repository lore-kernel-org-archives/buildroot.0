From: Assaf Inbal <shmuelzon@gmail.com>
Date: Mon, 20 May 2013 15:56:33 +0300
Subject: [Buildroot] [PATCH 01/12] coxpcall: Updated source location
Message-ID: <1369054604-26139-1-git-send-email-shmuelzon@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Assaf Inbal <shmuelzon@gmail.com>
---
 package/coxpcall/coxpcall.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/coxpcall/coxpcall.mk b/package/coxpcall/coxpcall.mk
index e7fb76d..f260d72 100644
--- a/package/coxpcall/coxpcall.mk
+++ b/package/coxpcall/coxpcall.mk
@@ -5,7 +5,7 @@
 #############################################################
 
 COXPCALL_VERSION = 1.13.0
-COXPCALL_SITE = http://luaforge.net/frs/download.php/3406
+COXPCALL_SITE = http://github.com/downloads/keplerproject/coxpcall
 COXPCALL_DEPENDENCIES = lua
 COXPCALL_LICENSE = MIT
 
-- 
1.8.1.2
