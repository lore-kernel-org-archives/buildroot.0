From: Francois Perrad <fperrad@gmail.com>
Date: Wed, 14 Apr 2021 11:57:18 +0200
Subject: [Buildroot] [PATCH 1/2] package/luarocks: bump to version 3.7.0
Message-ID: <20210414095719.26901-1-francois.perrad@gadz.org>
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
index 4a3ec0cf7..42e039214 100644
--- a/package/luarocks/luarocks.hash
+++ b/package/luarocks/luarocks.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  701d0cc0c7e97cc2cf2c2f4068fce45e52a8854f5dc6c9e49e2014202eec9a4f  luarocks-3.5.0.tar.gz
+sha256  9255d97fee95cec5b54fc6ac718b11bf5029e45bed7873e053314919cd448551  luarocks-3.7.0.tar.gz
 sha256  542ad0ee9b8ba582437ca7b4d0959c9b9432f25d2067f144d017188a7a84dd2f  COPYING
diff --git a/package/luarocks/luarocks.mk b/package/luarocks/luarocks.mk
index dd11b738a..28a421925 100644
--- a/package/luarocks/luarocks.mk
+++ b/package/luarocks/luarocks.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUAROCKS_VERSION = 3.5.0
+LUAROCKS_VERSION = 3.7.0
 LUAROCKS_SITE = http://luarocks.org/releases
 LUAROCKS_LICENSE = MIT
 LUAROCKS_LICENSE_FILES = COPYING
-- 
2.27.0
