From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 22 Feb 2013 23:28:24 +0100
Subject: [Buildroot] [git commit branch/next] luajit: bump to version 2.0.1
Message-ID: <20130222222818.A83329AC58@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7f68a28d78eee37dd32f0fcf9083e86ad1e79485
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/luajit/luajit.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/luajit/luajit.mk b/package/luajit/luajit.mk
index 844122e..bf9cfe8 100644
--- a/package/luajit/luajit.mk
+++ b/package/luajit/luajit.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-LUAJIT_VERSION = 2.0.0
+LUAJIT_VERSION = 2.0.1
 LUAJIT_SOURCE  = LuaJIT-$(LUAJIT_VERSION).tar.gz
 LUAJIT_SITE    = http://luajit.org/download
 LUAJIT_LICENSE = MIT
