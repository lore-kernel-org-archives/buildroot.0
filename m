From: Francois Perrad <fperrad@gmail.com>
Date: Wed,  2 Sep 2020 17:08:16 +0200
Subject: [Buildroot] [PATCH 4/6] package/lua-std-normalize: bump to version
 2.0.3
In-Reply-To: <20200902150818.874743-1-francois.perrad@gadz.org>
References: <20200902150818.874743-1-francois.perrad@gadz.org>
Message-ID: <20200902150818.874743-4-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

diff LICENSE.md:
- Copyright (C) 2002-2018 normalize authors
+ Copyright (C) 2002-2020 normalize authors

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/lua-std-normalize/lua-std-normalize.hash | 6 +++---
 package/lua-std-normalize/lua-std-normalize.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/lua-std-normalize/lua-std-normalize.hash b/package/lua-std-normalize/lua-std-normalize.hash
index 7c11f4914..84cdfca42 100644
--- a/package/lua-std-normalize/lua-std-normalize.hash
+++ b/package/lua-std-normalize/lua-std-normalize.hash
@@ -1,3 +1,3 @@
-# Locally calculated
-sha256 50baac6fbcbc6bbe72b63ce0871ec36176d75c04dccc6e368590ba6ef107c67a  std.normalize-2.0.2-1.src.rock
-sha256 a6a0a0ddc04f7437806a52cbd637c819144df7626a2e8a496cd3a2e20c8effb3  normalize-2.0.2/LICENSE.md
+# computed by luarocks/buildroot
+sha256 3a040b6ca43297367c527e12c1aab37acab86289f9415ffb130544c48b17f802  std.normalize-2.0.3-1.src.rock
+sha256 9c9094f0cea86c2c62b893e59a78d5eaed69df0d7da24e122ef9753baeef0f04  normalize-2.0.3/LICENSE.md
diff --git a/package/lua-std-normalize/lua-std-normalize.mk b/package/lua-std-normalize/lua-std-normalize.mk
index d3a58aa0d..0eb215bf8 100644
--- a/package/lua-std-normalize/lua-std-normalize.mk
+++ b/package/lua-std-normalize/lua-std-normalize.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUA_STD_NORMALIZE_VERSION_UPSTREAM = 2.0.2
+LUA_STD_NORMALIZE_VERSION_UPSTREAM = 2.0.3
 LUA_STD_NORMALIZE_VERSION = $(LUA_STD_NORMALIZE_VERSION_UPSTREAM)-1
 LUA_STD_NORMALIZE_NAME_UPSTREAM = std.normalize
 LUA_STD_NORMALIZE_SUBDIR = normalize-$(LUA_STD_NORMALIZE_VERSION_UPSTREAM)
-- 
2.25.1
