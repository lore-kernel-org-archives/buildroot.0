From: Francois Perrad <fperrad@gmail.com>
Date: Wed,  2 Sep 2020 17:08:18 +0200
Subject: [Buildroot] [PATCH 6/6] package/lua-utf8:bump to version 0.1.3
In-Reply-To: <20200902150818.874743-1-francois.perrad@gadz.org>
References: <20200902150818.874743-1-francois.perrad@gadz.org>
Message-ID: <20200902150818.874743-6-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/lua-utf8/lua-utf8.hash | 4 ++--
 package/lua-utf8/lua-utf8.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/lua-utf8/lua-utf8.hash b/package/lua-utf8/lua-utf8.hash
index 28cdfb397..135574f36 100644
--- a/package/lua-utf8/lua-utf8.hash
+++ b/package/lua-utf8/lua-utf8.hash
@@ -1,3 +1,3 @@
 # computed by luarocks/buildroot
-sha256 b6f16ea49232b212870ab0612a8188d8956fdf6369835e3ae7df517550be18e0  luautf8-0.1.2-2.src.rock
-sha256 74506285923bcc3e58aaca1b774db26461021783d02b2dc26bafcaa02ef7a00b  luautf8-0.1.2/LICENSE
+sha256 88c456bc0f00d28201b33551d83fa6e5c3ae6025aebec790c37afb317290e4fa  luautf8-0.1.3-1.src.rock
+sha256 74506285923bcc3e58aaca1b774db26461021783d02b2dc26bafcaa02ef7a00b  luautf8-0.1.3/LICENSE
diff --git a/package/lua-utf8/lua-utf8.mk b/package/lua-utf8/lua-utf8.mk
index 9799f4098..52aaf5c71 100644
--- a/package/lua-utf8/lua-utf8.mk
+++ b/package/lua-utf8/lua-utf8.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUA_UTF8_VERSION = 0.1.2-2
+LUA_UTF8_VERSION = 0.1.3-1
 LUA_UTF8_NAME_UPSTREAM = luautf8
 LUA_UTF8_LICENSE = MIT
 LUA_UTF8_LICENSE_FILES = $(LUA_UTF8_SUBDIR)/LICENSE
-- 
2.25.1
