From: Francois Perrad <fperrad@gmail.com>
Date: Wed, 13 Sep 2017 10:23:56 +0200
Subject: [Buildroot] [PATCH] luarocks: bump to version 2.4.3
Message-ID: <20170913082356.25669-1-francois.perrad@gadz.org>
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
index fb01993f0..27845a46c 100644
--- a/package/luarocks/luarocks.hash
+++ b/package/luarocks/luarocks.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256	0e1ec34583e1b265e0fbafb64c8bd348705ad403fe85967fd05d3a659f74d2e5  luarocks-2.4.2.tar.gz
+sha256 4d414d32fed5bb121c72d3ff1280b7f2dc9027a9bc012e41dfbffd5b519b362e  luarocks-2.4.3.tar.gz
diff --git a/package/luarocks/luarocks.mk b/package/luarocks/luarocks.mk
index bc700a5f9..e050cb553 100644
--- a/package/luarocks/luarocks.mk
+++ b/package/luarocks/luarocks.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUAROCKS_VERSION = 2.4.2
+LUAROCKS_VERSION = 2.4.3
 LUAROCKS_SITE = http://luarocks.org/releases
 LUAROCKS_LICENSE = MIT
 LUAROCKS_LICENSE_FILES = COPYING
-- 
2.11.0
