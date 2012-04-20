From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 20 Apr 2012 07:24:43 -0300
Subject: [Buildroot] [PATCH] taglib: bump to version 1.7.1
Message-ID: <1334917483-16298-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/multimedia/taglib/taglib.mk |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/package/multimedia/taglib/taglib.mk b/package/multimedia/taglib/taglib.mk
index ce6adeb..da2db0c 100644
--- a/package/multimedia/taglib/taglib.mk
+++ b/package/multimedia/taglib/taglib.mk
@@ -3,7 +3,8 @@
 # taglib
 #
 #############################################################
-TAGLIB_VERSION = 1.7
+
+TAGLIB_VERSION = 1.7.1
 TAGLIB_SOURCE = taglib-$(TAGLIB_VERSION).tar.gz
 TAGLIB_SITE = http://developer.kde.org/~wheeler/files/src
 TAGLIB_INSTALL_STAGING = YES
-- 
1.7.3.4
