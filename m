From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 21 May 2015 19:12:00 +0200
Subject: [Buildroot] [git commit] package/luajit: bump to version 2.0.4
Message-ID: <20150601220248.3B94B81D62@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=de8494e31a5ef75017c140d294155ddee6390490
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/luajit/luajit.hash |    2 +-
 package/luajit/luajit.mk   |    2 +-
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
