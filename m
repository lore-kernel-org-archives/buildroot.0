From: Francois Perrad <fperrad@gmail.com>
Date: Sun, 16 Sep 2018 08:51:43 +0200
Subject: [Buildroot] [PATCH] luarocks: bump to version 3.0.3
Message-ID: <20180916065143.30181-1-francois.perrad@gadz.org>
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
index 9917b1b5d..6c4a103f3 100644
--- a/package/luarocks/luarocks.hash
+++ b/package/luarocks/luarocks.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 3836267eff2f85fb552234e966602b1e649c58f81f47c7de3785e071c8127f5a  luarocks-3.0.2.tar.gz
+sha256 f9a3fca236c87db55bc128a182ff605731ca15b43b1c4942d98f5e34acc88a6e  luarocks-3.0.3.tar.gz
 sha256 542ad0ee9b8ba582437ca7b4d0959c9b9432f25d2067f144d017188a7a84dd2f  COPYING
diff --git a/package/luarocks/luarocks.mk b/package/luarocks/luarocks.mk
index ad057d891..0af775c78 100644
--- a/package/luarocks/luarocks.mk
+++ b/package/luarocks/luarocks.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUAROCKS_VERSION = 3.0.2
+LUAROCKS_VERSION = 3.0.3
 LUAROCKS_SITE = http://luarocks.org/releases
 LUAROCKS_LICENSE = MIT
 LUAROCKS_LICENSE_FILES = COPYING
-- 
2.17.1
