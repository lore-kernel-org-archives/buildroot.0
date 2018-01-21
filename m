From: Francois Perrad <fperrad@gmail.com>
Date: Sun, 21 Jan 2018 12:03:35 +0100
Subject: [Buildroot] [PATCH 8/8] lua-resty-http: bump to version 0.12
In-Reply-To: <20180121110335.20927-1-francois.perrad@gadz.org>
References: <20180121110335.20927-1-francois.perrad@gadz.org>
Message-ID: <20180121110335.20927-8-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/lua-resty-http/lua-resty-http.hash | 2 +-
 package/lua-resty-http/lua-resty-http.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/lua-resty-http/lua-resty-http.hash b/package/lua-resty-http/lua-resty-http.hash
index 95f011bbc..e45df0e91 100644
--- a/package/lua-resty-http/lua-resty-http.hash
+++ b/package/lua-resty-http/lua-resty-http.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 12d9aa9a49efdb752c1afb19a6d0a758de6c8dd2dad24ea48bd09e03f7a0e0f1  lua-resty-http-0.11-0.src.rock
+sha256 4628413a5a2828645e3ddb38a2a0c764e81443cbd1a011357eeed7e983750329  lua-resty-http-0.12-0.src.rock
diff --git a/package/lua-resty-http/lua-resty-http.mk b/package/lua-resty-http/lua-resty-http.mk
index e79982e20..2aee63d78 100644
--- a/package/lua-resty-http/lua-resty-http.mk
+++ b/package/lua-resty-http/lua-resty-http.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUA_RESTY_HTTP_VERSION = 0.11-0
+LUA_RESTY_HTTP_VERSION = 0.12-0
 LUA_RESTY_HTTP_SUBDIR = lua-resty-http
 LUA_RESTY_HTTP_LICENSE = BSD-2-Clause
 LUA_RESTY_HTTP_LICENSE_FILES = $(LUA_RESTY_HTTP_SUBDIR)/LICENSE
-- 
2.11.0
