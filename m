From: Francois Perrad <fperrad@gmail.com>
Date: Sun, 21 Jan 2018 12:03:30 +0100
Subject: [Buildroot] [PATCH 3/8] lua-csnappy: bump to version 0.1.5
In-Reply-To: <20180121110335.20927-1-francois.perrad@gadz.org>
References: <20180121110335.20927-1-francois.perrad@gadz.org>
Message-ID: <20180121110335.20927-3-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/lua-csnappy/lua-csnappy.hash | 2 +-
 package/lua-csnappy/lua-csnappy.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/lua-csnappy/lua-csnappy.hash b/package/lua-csnappy/lua-csnappy.hash
index 136363497..f88742644 100644
--- a/package/lua-csnappy/lua-csnappy.hash
+++ b/package/lua-csnappy/lua-csnappy.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256	855331feb8e09a32eea8366ab9bcd4386db6392de82383f08ae5e59adbb7d8a6  lua-csnappy-0.1.4-1.src.rock
+sha256	4fc373ba714cb8b428e9971f1725d82de6a43dfea361a0b7894e4762238dc95c  lua-csnappy-0.1.5-1.src.rock
diff --git a/package/lua-csnappy/lua-csnappy.mk b/package/lua-csnappy/lua-csnappy.mk
index 3325f1f53..cba0a0608 100644
--- a/package/lua-csnappy/lua-csnappy.mk
+++ b/package/lua-csnappy/lua-csnappy.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUA_CSNAPPY_VERSION = 0.1.4-1
+LUA_CSNAPPY_VERSION = 0.1.5-1
 LUA_CSNAPPY_LICENSE = BSD-3-Clause
 LUA_CSNAPPY_LICENSE_FILES = $(LUA_CSNAPPY_SUBDIR)/COPYRIGHT
 
-- 
2.11.0
