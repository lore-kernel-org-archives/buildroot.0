From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 17 Dec 2010 14:04:29 -0300
Subject: [Buildroot] [PATCH 08/13] tar: bump to version 1.25
In-Reply-To: <1292605474-19443-1-git-send-email-gustavo@zacarias.com.ar>
References: <1292605474-19443-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1292605474-19443-8-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/tar/tar.mk |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/tar/tar.mk b/package/tar/tar.mk
index f9ee74b..e1e16a2 100644
--- a/package/tar/tar.mk
+++ b/package/tar/tar.mk
@@ -3,8 +3,8 @@
 # tar
 #
 #############################################################
-TAR_VERSION:=1.21
-TAR_SOURCE:=tar-$(TAR_VERSION).tar.bz2
-TAR_SITE:=$(BR2_GNU_MIRROR)/tar/
+
+TAR_VERSION = 1.25
+TAR_SITE = $(BR2_GNU_MIRROR)/tar
 
 $(eval $(call AUTOTARGETS,package,tar))
-- 
1.7.2.2
