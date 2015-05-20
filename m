From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Wed, 20 May 2015 09:41:48 +0200
Subject: [Buildroot] [PATCH 1/3] package/luajit: bump to version 2.0.4
Message-ID: <1432107710-3982-1-git-send-email-joerg.krause@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
---
 package/luajit/luajit.hash | 2 +-
 package/luajit/luajit.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/luajit/luajit.hash b/package/luajit/luajit.hash
index 9c238e7..086bef0 100644
--- a/package/luajit/luajit.hash
+++ b/package/luajit/luajit.hash
@@ -1,2 +1,2 @@
 # Hashes from: http://luajit.org/download.html
-md5 f14e9104be513913810cd59c8c658dc0    LuaJIT-2.0.3.tar.gz
+md5 dd9c38307f2223a504cbfb96e477eca0    LuaJIT-2.0.4.tar.gz
diff --git a/package/luajit/luajit.mk b/package/luajit/luajit.mk
index 89f6a1d..d45598e 100644
--- a/package/luajit/luajit.mk
+++ b/package/luajit/luajit.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUAJIT_VERSION = 2.0.3
+LUAJIT_VERSION = 2.0.4
 LUAJIT_SOURCE = LuaJIT-$(LUAJIT_VERSION).tar.gz
 LUAJIT_SITE = http://luajit.org/download
 LUAJIT_LICENSE = MIT
-- 
2.4.1
