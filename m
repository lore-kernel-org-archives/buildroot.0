From: Francois Perrad <fperrad@gmail.com>
Date: Thu, 28 Mar 2019 18:20:48 +0100
Subject: [Buildroot] [PATCH 4/4] package/lua-resty-http: bump to 0.13
In-Reply-To: <20190328172048.30238-1-francois.perrad@gadz.org>
References: <20190328172048.30238-1-francois.perrad@gadz.org>
Message-ID: <20190328172048.30238-4-francois.perrad@gadz.org>
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
index 486a110a7..e8318ab41 100644
--- a/package/lua-resty-http/lua-resty-http.hash
+++ b/package/lua-resty-http/lua-resty-http.hash
@@ -1,3 +1,3 @@
 # computed by luarocks/buildroot
-sha256 4628413a5a2828645e3ddb38a2a0c764e81443cbd1a011357eeed7e983750329  lua-resty-http-0.12-0.src.rock
+sha256 e31b96c622f539d69a9e84febf06d9a1df0f55aa3bfd904dd7c4ac6ed64fe3fe  lua-resty-http-0.13-0.src.rock
 sha256 407e4b1412d8afa317dc703a1d318866c3de87d78899402125cbd90548c6057d  lua-resty-http/LICENSE
diff --git a/package/lua-resty-http/lua-resty-http.mk b/package/lua-resty-http/lua-resty-http.mk
index 2aee63d78..6494ad104 100644
--- a/package/lua-resty-http/lua-resty-http.mk
+++ b/package/lua-resty-http/lua-resty-http.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUA_RESTY_HTTP_VERSION = 0.12-0
+LUA_RESTY_HTTP_VERSION = 0.13-0
 LUA_RESTY_HTTP_SUBDIR = lua-resty-http
 LUA_RESTY_HTTP_LICENSE = BSD-2-Clause
 LUA_RESTY_HTTP_LICENSE_FILES = $(LUA_RESTY_HTTP_SUBDIR)/LICENSE
-- 
2.17.1
