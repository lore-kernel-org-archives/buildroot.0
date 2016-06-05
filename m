From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 5 Jun 2016 22:01:53 +0200
Subject: [Buildroot] [git commit] package/turbolua: bump version
Message-ID: <20160605200530.D838281E84@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2eccef8be7c4af508c35b18dc2d09d8233c4178b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/turbolua/turbolua.hash | 2 +-
 package/turbolua/turbolua.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/turbolua/turbolua.hash b/package/turbolua/turbolua.hash
index ea7898c..d460b4f 100644
--- a/package/turbolua/turbolua.hash
+++ b/package/turbolua/turbolua.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 4f7e3121fcc25a5867a264a6f09acf641c904668f5822b1533881f40a3b863ea turbolua-91db237a6690f4a659cbdee2ebbbbc9741d8ea4c.tar.gz
+sha256 bff771b6a670f764366eff50e1644f1c5d8d526324e0b6adfda42d9f69791833 turbolua-6fbc5cbfed1cc8c3820d4c1bfb55258c764040f0.tar.gz
diff --git a/package/turbolua/turbolua.mk b/package/turbolua/turbolua.mk
index fe6db31..bf6d491 100644
--- a/package/turbolua/turbolua.mk
+++ b/package/turbolua/turbolua.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TURBOLUA_VERSION = 91db237a6690f4a659cbdee2ebbbbc9741d8ea4c
+TURBOLUA_VERSION = 6fbc5cbfed1cc8c3820d4c1bfb55258c764040f0
 TURBOLUA_SITE = $(call github,kernelsauce,turbo,$(TURBOLUA_VERSION))
 TURBOLUA_DEPENDENCIES = luajit
 TURBOLUA_LICENSE = Apache-2.0
