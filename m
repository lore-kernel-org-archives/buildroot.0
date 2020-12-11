From: Francois Perrad <fperrad@gmail.com>
Date: Fri, 11 Dec 2020 19:35:08 +0100
Subject: [Buildroot] [PATCH] package/luarocks: bump to version 3.5.0
Message-ID: <20201211183508.30229-1-francois.perrad@gadz.org>
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
index 565b1cccf..4a3ec0cf7 100644
--- a/package/luarocks/luarocks.hash
+++ b/package/luarocks/luarocks.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  62ce5826f0eeeb760d884ea8330cd1552b5d432138b8bade0fa72f35badd02d0  luarocks-3.4.0.tar.gz
+sha256  701d0cc0c7e97cc2cf2c2f4068fce45e52a8854f5dc6c9e49e2014202eec9a4f  luarocks-3.5.0.tar.gz
 sha256  542ad0ee9b8ba582437ca7b4d0959c9b9432f25d2067f144d017188a7a84dd2f  COPYING
diff --git a/package/luarocks/luarocks.mk b/package/luarocks/luarocks.mk
index 670e7487a..42966ea63 100644
--- a/package/luarocks/luarocks.mk
+++ b/package/luarocks/luarocks.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUAROCKS_VERSION = 3.4.0
+LUAROCKS_VERSION = 3.5.0
 LUAROCKS_SITE = http://luarocks.org/releases
 LUAROCKS_LICENSE = MIT
 LUAROCKS_LICENSE_FILES = COPYING
-- 
2.25.1
