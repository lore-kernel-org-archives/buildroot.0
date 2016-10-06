From: Francois Perrad <fperrad@gmail.com>
Date: Thu,  6 Oct 2016 21:35:26 +0200
Subject: [Buildroot] [PATCH] luarocks: bump to version 2.4.1
Message-ID: <1475782526-10472-1-git-send-email-francois.perrad@gadz.org>
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
index 2750745..c35383a 100644
--- a/package/luarocks/luarocks.hash
+++ b/package/luarocks/luarocks.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256	44381c9128d036247d428531291d1ff9405ae1daa238581d3c15f96d899497c3  luarocks-2.4.0.tar.gz
+sha256	e429e0af9764bfd5cb640cac40f9d4ed1023fa17c052dff82ed0a41c05f3dcf9  luarocks-2.4.1.tar.gz
diff --git a/package/luarocks/luarocks.mk b/package/luarocks/luarocks.mk
index 4a5ae03..64c8d5b 100644
--- a/package/luarocks/luarocks.mk
+++ b/package/luarocks/luarocks.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUAROCKS_VERSION = 2.4.0
+LUAROCKS_VERSION = 2.4.1
 LUAROCKS_SITE = http://luarocks.org/releases
 LUAROCKS_LICENSE = MIT
 LUAROCKS_LICENSE_FILES = COPYING
-- 
2.7.4
