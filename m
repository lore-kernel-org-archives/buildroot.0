From: Francois Perrad <fperrad@gmail.com>
Date: Mon,  6 May 2019 21:32:13 +0200
Subject: [Buildroot] [PATCH] package/luarocks: bump to version 3.1.1
Message-ID: <20190506193213.22345-1-francois.perrad@gadz.org>
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
index a0369516e..aed0274b5 100644
--- a/package/luarocks/luarocks.hash
+++ b/package/luarocks/luarocks.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 865eae1e49b0f701c955c1c8f7b6fae99287c9cef32227d64177509224908921  luarocks-3.1.0.tar.gz
+sha256 3c26c102f8e69f81e12ea39037c770a00b6244e115a4c832e7a92feffdfad1aa  luarocks-3.1.1.tar.gz
 sha256 542ad0ee9b8ba582437ca7b4d0959c9b9432f25d2067f144d017188a7a84dd2f  COPYING
diff --git a/package/luarocks/luarocks.mk b/package/luarocks/luarocks.mk
index fc71ede07..6a8254fd4 100644
--- a/package/luarocks/luarocks.mk
+++ b/package/luarocks/luarocks.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUAROCKS_VERSION = 3.1.0
+LUAROCKS_VERSION = 3.1.1
 LUAROCKS_SITE = http://luarocks.org/releases
 LUAROCKS_LICENSE = MIT
 LUAROCKS_LICENSE_FILES = COPYING
-- 
2.20.1
