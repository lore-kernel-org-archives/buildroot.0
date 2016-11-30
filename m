From: Francois Perrad <fperrad@gmail.com>
Date: Wed, 30 Nov 2016 17:10:41 +0100
Subject: [Buildroot] [PATCH 3/3] luarocks: bump to version 2.4.2
In-Reply-To: <20161130161041.22566-1-francois.perrad@gadz.org>
References: <20161130161041.22566-1-francois.perrad@gadz.org>
Message-ID: <20161130161041.22566-3-francois.perrad@gadz.org>
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
index c35383a..fb01993 100644
--- a/package/luarocks/luarocks.hash
+++ b/package/luarocks/luarocks.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256	e429e0af9764bfd5cb640cac40f9d4ed1023fa17c052dff82ed0a41c05f3dcf9  luarocks-2.4.1.tar.gz
+sha256	0e1ec34583e1b265e0fbafb64c8bd348705ad403fe85967fd05d3a659f74d2e5  luarocks-2.4.2.tar.gz
diff --git a/package/luarocks/luarocks.mk b/package/luarocks/luarocks.mk
index 64c8d5b..4e0d537 100644
--- a/package/luarocks/luarocks.mk
+++ b/package/luarocks/luarocks.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUAROCKS_VERSION = 2.4.1
+LUAROCKS_VERSION = 2.4.2
 LUAROCKS_SITE = http://luarocks.org/releases
 LUAROCKS_LICENSE = MIT
 LUAROCKS_LICENSE_FILES = COPYING
-- 
2.9.3
