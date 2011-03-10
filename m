From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 10 Mar 2011 10:44:35 -0300
Subject: [Buildroot] [PATCH 5/5] midori: bump to version 0.3.2
In-Reply-To: <1299764675-23308-1-git-send-email-gustavo@zacarias.com.ar>
References: <1299764675-23308-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1299764675-23308-5-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/midori/midori.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/midori/midori.mk b/package/midori/midori.mk
index af227d4..5f6315f 100644
--- a/package/midori/midori.mk
+++ b/package/midori/midori.mk
@@ -4,9 +4,9 @@
 #
 #############################################################
 
-MIDORI_VERSION = 0.2.9
+MIDORI_VERSION = 0.3.2
 MIDORI_SOURCE = midori-$(MIDORI_VERSION).tar.bz2
-MIDORI_SITE = http://archive.xfce.org/src/apps/midori/0.2/
+MIDORI_SITE = http://archive.xfce.org/src/apps/midori/0.3/
 MIDORI_INSTALL_TARGET = YES
 
 MIDORI_DEPENDENCIES = host-pkg-config host-intltool webkit libsexy libgtk2
-- 
1.7.3.4
