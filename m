From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sat, 15 Oct 2011 00:07:17 -0300
Subject: [Buildroot] [PATCH 03/25] which: style cleanup
In-Reply-To: <1318648059-30431-1-git-send-email-gustavo@zacarias.com.ar>
References: <1318648059-30431-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1318648059-30431-3-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/which/which.mk |    9 +++------
 1 files changed, 3 insertions(+), 6 deletions(-)

diff --git a/package/which/which.mk b/package/which/which.mk
index 628711d..a7bb577 100644
--- a/package/which/which.mk
+++ b/package/which/which.mk
@@ -3,11 +3,8 @@
 # which
 #
 #############################################################
-WHICH_VERSION:=2.20
-WHICH_SOURCE:=which-$(WHICH_VERSION).tar.gz
-WHICH_SITE:=http://www.xs4all.nl/~carlo17/which/
-WHICH_AUTORECONF:=NO
-WHICH_INSTALL_STAGING:=NO
-WHICH_INSTALL_TARGET:=YES
+
+WHICH_VERSION = 2.20
+WHICH_SITE = http://carlo17.home.xs4all.nl/which
 
 $(eval $(call AUTOTARGETS))
-- 
1.7.3.4
