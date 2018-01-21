From: Francois Perrad <fperrad@gmail.com>
Date: Sun, 21 Jan 2018 12:03:32 +0100
Subject: [Buildroot] [PATCH 5/8] lua-testmore: bump to version 0.3.3
In-Reply-To: <20180121110335.20927-1-francois.perrad@gadz.org>
References: <20180121110335.20927-1-francois.perrad@gadz.org>
Message-ID: <20180121110335.20927-5-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/lua-testmore/lua-testmore.hash | 2 +-
 package/lua-testmore/lua-testmore.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/lua-testmore/lua-testmore.hash b/package/lua-testmore/lua-testmore.hash
index 439097b93..8db664f2d 100644
--- a/package/lua-testmore/lua-testmore.hash
+++ b/package/lua-testmore/lua-testmore.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256	a76a9b707487bf3e8b6a5362640bc2e010d184c4f66e423de7b28bd480a0db90  lua-testmore-0.3.2-1.src.rock
+sha256	163055ef92df9e01d9ae57cd45d6f6aace1ff4dd3abf7e29b9e30ecb1ab76ae2  lua-testmore-0.3.3-1.src.rock
diff --git a/package/lua-testmore/lua-testmore.mk b/package/lua-testmore/lua-testmore.mk
index 04482e258..790477611 100644
--- a/package/lua-testmore/lua-testmore.mk
+++ b/package/lua-testmore/lua-testmore.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUA_TESTMORE_VERSION = 0.3.2-1
+LUA_TESTMORE_VERSION = 0.3.3-1
 LUA_TESTMORE_NAME_UPSTREAM = lua-TestMore
 LUA_TESTMORE_LICENSE = MIT
 LUA_TESTMORE_LICENSE_FILES = $(LUA_TESTMORE_SUBDIR)/COPYRIGHT
-- 
2.11.0
