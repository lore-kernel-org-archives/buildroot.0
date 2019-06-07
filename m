From: Francois Perrad <fperrad@gmail.com>
Date: Fri,  7 Jun 2019 19:13:14 +0200
Subject: [Buildroot] [PATCH] package/luarocks: bump to version 3.1.3
Message-ID: <20190607171314.28685-1-francois.perrad@gadz.org>
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
index 6936bfbbb..0e65659c4 100644
--- a/package/luarocks/luarocks.hash
+++ b/package/luarocks/luarocks.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 72a3b74f05b7fd011eed894dc34193ee80b3235fe58016ac9ffdbfceecc88950  luarocks-3.1.2.tar.gz
+sha256 c573435f495aac159e34eaa0a3847172a2298eb6295fcdc35d565f9f9b990513  luarocks-3.1.3.tar.gz
 sha256 542ad0ee9b8ba582437ca7b4d0959c9b9432f25d2067f144d017188a7a84dd2f  COPYING
diff --git a/package/luarocks/luarocks.mk b/package/luarocks/luarocks.mk
index 0d05b448a..d7d0e4077 100644
--- a/package/luarocks/luarocks.mk
+++ b/package/luarocks/luarocks.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUAROCKS_VERSION = 3.1.2
+LUAROCKS_VERSION = 3.1.3
 LUAROCKS_SITE = http://luarocks.org/releases
 LUAROCKS_LICENSE = MIT
 LUAROCKS_LICENSE_FILES = COPYING
-- 
2.20.1
