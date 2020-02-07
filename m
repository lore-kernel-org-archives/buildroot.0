From: Francois Perrad <fperrad@gmail.com>
Date: Fri,  7 Feb 2020 15:59:55 +0100
Subject: [Buildroot] [PATCH] package/luarocks: bump to version 3.3.1
Message-ID: <20200207145955.17509-1-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/luarocks/luarocks.hash | 2 +-
 package/luarocks/luarocks.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/luarocks/luarocks.hash b/package/luarocks/luarocks.hash
index f00172917..069d181d6 100644
--- a/package/luarocks/luarocks.hash
+++ b/package/luarocks/luarocks.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 8de54eb851f5245ed3708d94d8872e825b9704049d3ad4febe8e219f419b427d  luarocks-3.3.0.tar.gz
+sha256 eb20cd9814df05535d9aae98da532217c590fc07d48d90ca237e2a7cdcf284fe  luarocks-3.3.1.tar.gz
 sha256 542ad0ee9b8ba582437ca7b4d0959c9b9432f25d2067f144d017188a7a84dd2f  COPYING
diff --git a/package/luarocks/luarocks.mk b/package/luarocks/luarocks.mk
index 84b3fe438..123f8c073 100644
--- a/package/luarocks/luarocks.mk
+++ b/package/luarocks/luarocks.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUAROCKS_VERSION = 3.3.0
+LUAROCKS_VERSION = 3.3.1
 LUAROCKS_SITE = http://luarocks.org/releases
 LUAROCKS_LICENSE = MIT
 LUAROCKS_LICENSE_FILES = COPYING
-- 
2.20.1
