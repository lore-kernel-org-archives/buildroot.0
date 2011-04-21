From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 21 Apr 2011 23:37:29 +0200
Subject: [Buildroot] [git commit] less: bump to version 443
Message-ID: <20110421214558.776098293A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=67be03806fe7c9b047b2d505c6c0fc27cef447ca
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/less/less.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/less/less.mk b/package/less/less.mk
index 6f985ed..2379c8f 100644
--- a/package/less/less.mk
+++ b/package/less/less.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-LESS_VERSION = 436
+LESS_VERSION = 443
 LESS_SITE = http://www.greenwoodsoftware.com/less
 LESS_DEPENDENCIES = ncurses
 
-- 
1.7.3.4
