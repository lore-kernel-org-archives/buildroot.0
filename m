From: Francois Perrad <fperrad@gmail.com>
Date: Sat, 26 Sep 2020 11:33:58 +0200
Subject: [Buildroot] [PATCH] package/luarocks: bump to version 3.4.0
Message-ID: <20200926093359.952522-1-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/luarocks/luarocks.hash | 4 ++--
 package/luarocks/luarocks.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/luarocks/luarocks.hash b/package/luarocks/luarocks.hash
index 069d181d6..565b1cccf 100644
--- a/package/luarocks/luarocks.hash
+++ b/package/luarocks/luarocks.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 eb20cd9814df05535d9aae98da532217c590fc07d48d90ca237e2a7cdcf284fe  luarocks-3.3.1.tar.gz
-sha256 542ad0ee9b8ba582437ca7b4d0959c9b9432f25d2067f144d017188a7a84dd2f  COPYING
+sha256  62ce5826f0eeeb760d884ea8330cd1552b5d432138b8bade0fa72f35badd02d0  luarocks-3.4.0.tar.gz
+sha256  542ad0ee9b8ba582437ca7b4d0959c9b9432f25d2067f144d017188a7a84dd2f  COPYING
diff --git a/package/luarocks/luarocks.mk b/package/luarocks/luarocks.mk
index 14f05b349..00b3e17cb 100644
--- a/package/luarocks/luarocks.mk
+++ b/package/luarocks/luarocks.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUAROCKS_VERSION = 3.3.1
+LUAROCKS_VERSION = 3.4.0
 LUAROCKS_SITE = http://luarocks.org/releases
 LUAROCKS_LICENSE = MIT
 LUAROCKS_LICENSE_FILES = COPYING
-- 
2.25.1
