From: Francois Perrad <fperrad@gmail.com>
Date: Sat,  2 Sep 2017 18:56:33 +0200
Subject: [Buildroot] [PATCH 03/12] coxpcall: bump to version 1.16.0
In-Reply-To: <20170902165642.22943-1-francois.perrad@gadz.org>
References: <20170902165642.22943-1-francois.perrad@gadz.org>
Message-ID: <20170902165642.22943-3-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/coxpcall/Config.in     | 6 +++---
 package/coxpcall/coxpcall.hash | 2 +-
 package/coxpcall/coxpcall.mk   | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/coxpcall/Config.in b/package/coxpcall/Config.in
index 1237482ff..373501795 100644
--- a/package/coxpcall/Config.in
+++ b/package/coxpcall/Config.in
@@ -2,7 +2,7 @@ config BR2_PACKAGE_COXPCALL
 	bool "coxpcall"
 	help
 	  Coxpcall encapsulates the protected calls with a coroutine
-	  based loop, so errors can be dealed without the usual
-	  pcall/xpcall issues with coroutines.
+	  based loop, so errors can be handled without the usual
+	  pcall/xpcall issues with coroutines for Lua 5.1.
 
-	  http://coxpcall.luaforge.net/
+	  http://keplerproject.github.io/coxpcall/
diff --git a/package/coxpcall/coxpcall.hash b/package/coxpcall/coxpcall.hash
index d7a02c201..e037af9e8 100644
--- a/package/coxpcall/coxpcall.hash
+++ b/package/coxpcall/coxpcall.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256	ff93d30e0a6cd64bb4e66739757e7eda9f226187829a075747b2ca5d3cfd1075	coxpcall-1.15.0-1.src.rock
+sha256 c1488ee08e5d25d59a11e19cb0322edae509202b246d0c93cb2de1676dbfdf2b  coxpcall-1.16.0-1.src.rock
diff --git a/package/coxpcall/coxpcall.mk b/package/coxpcall/coxpcall.mk
index 9c2114379..84c19f4ae 100644
--- a/package/coxpcall/coxpcall.mk
+++ b/package/coxpcall/coxpcall.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-COXPCALL_VERSION = 1.15.0-1
+COXPCALL_VERSION = 1.16.0-1
 COXPCALL_SUBDIR = coxpcall
 COXPCALL_LICENSE = MIT
 
-- 
2.11.0
