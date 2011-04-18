From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 18 Apr 2011 11:09:20 -0300
Subject: [Buildroot] [PATCH 1/5] less: bump to version 443
Message-ID: <1303135764-20972-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
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
