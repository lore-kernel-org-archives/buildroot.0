From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 19 Jan 2021 18:51:10 +0100
Subject: [Buildroot] [git commit] package/lua-curl: bump to version 0.3.12
Message-ID: <20210119173252.ADA68888C8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e5cbf04e7cf75eca5fe953b9ddf9c2b3ba40ff51
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

diff LICENSE:
- Copyright (c) 2014-2019 Alexey Melnichuk
+ Copyright (c) 2014-2021 Alexey Melnichuk

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/lua-curl/lua-curl.hash | 4 ++--
 package/lua-curl/lua-curl.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/lua-curl/lua-curl.hash b/package/lua-curl/lua-curl.hash
index 33cc68e32e..5210ceb0f9 100644
--- a/package/lua-curl/lua-curl.hash
+++ b/package/lua-curl/lua-curl.hash
@@ -1,3 +1,3 @@
 # computed by luarocks/buildroot
-sha256 01578439ba90338abba86ec77641a4998450dbc42c06cff41eeefa119a6962bc  lua-curl-0.3.11-1.src.rock
-sha256 3049265c5c05a5e2a40eb28dbf3fe46a51cd03e5f62cc1a419e352130e278e02  Lua-cURLv3-0.3.11/LICENSE
+sha256 b6b860cd416ad883f2c7c2e1696aceda60c96036f660fb8c0236a5cc3d961c04  lua-curl-0.3.12-1.src.rock
+sha256 0f92f4c4665aadffb023de44b16022282040fe4409d5cd3148f1812dec30cdff  Lua-cURLv3-0.3.12/LICENSE
diff --git a/package/lua-curl/lua-curl.mk b/package/lua-curl/lua-curl.mk
index 3a0f1c69bf..37fbf30ccb 100644
--- a/package/lua-curl/lua-curl.mk
+++ b/package/lua-curl/lua-curl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUA_CURL_VERSION_UPSTREAM = 0.3.11
+LUA_CURL_VERSION_UPSTREAM = 0.3.12
 LUA_CURL_VERSION = $(LUA_CURL_VERSION_UPSTREAM)-1
 LUA_CURL_SUBDIR = Lua-cURLv3-$(LUA_CURL_VERSION_UPSTREAM)
 LUA_CURL_LICENSE = MIT
