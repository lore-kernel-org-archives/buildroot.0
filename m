From: Francois Perrad <fperrad@gmail.com>
Date: Wed, 31 Oct 2018 07:50:14 +0100
Subject: [Buildroot] [PATCH] luarocks: bump to version 3.0.4
Message-ID: <20181031065014.10160-1-francois.perrad@gadz.org>
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
index 6c4a103f3..224dbcc16 100644
--- a/package/luarocks/luarocks.hash
+++ b/package/luarocks/luarocks.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 f9a3fca236c87db55bc128a182ff605731ca15b43b1c4942d98f5e34acc88a6e  luarocks-3.0.3.tar.gz
+sha256 1236a307ca5c556c4fed9fdbd35a7e0e80ccf063024becc8c3bf212f37ff0edf  luarocks-3.0.4.tar.gz
 sha256 542ad0ee9b8ba582437ca7b4d0959c9b9432f25d2067f144d017188a7a84dd2f  COPYING
diff --git a/package/luarocks/luarocks.mk b/package/luarocks/luarocks.mk
index 0af775c78..cfef8f19b 100644
--- a/package/luarocks/luarocks.mk
+++ b/package/luarocks/luarocks.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUAROCKS_VERSION = 3.0.3
+LUAROCKS_VERSION = 3.0.4
 LUAROCKS_SITE = http://luarocks.org/releases
 LUAROCKS_LICENSE = MIT
 LUAROCKS_LICENSE_FILES = COPYING
-- 
2.17.1
