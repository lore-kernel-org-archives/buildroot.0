From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Thu, 21 May 2015 08:07:27 +0200
Subject: [Buildroot] [PATCH 1/1] package/leafnode2: Update upstream URL
Message-ID: <1432188447-5913-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Upstream URL has changed:
http://article.gmane.org/gmane.network.leafnode/4773

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/leafnode2/Config.in    |    2 +-
 package/leafnode2/leafnode2.mk |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/leafnode2/Config.in b/package/leafnode2/Config.in
index ec5fa80..348e6da 100644
--- a/package/leafnode2/Config.in
+++ b/package/leafnode2/Config.in
@@ -13,4 +13,4 @@ config BR2_PACKAGE_LEAFNODE2
 	  For example, you can add this line to inetd.conf:
 	  nntp    stream  tcp     nowait  news    /usr/sbin/leafnode
 
-	  http://www.dt.e-technik.uni-dortmund.de/~ma/leafnode/beta/
+	  http://www.dt.e-technik.tu-dortmund.de/~ma/leafnode/beta
diff --git a/package/leafnode2/leafnode2.mk b/package/leafnode2/leafnode2.mk
index 0fc2a8d..5b9b854 100644
--- a/package/leafnode2/leafnode2.mk
+++ b/package/leafnode2/leafnode2.mk
@@ -6,7 +6,7 @@
 
 LEAFNODE2_VERSION = 2.0.0.alpha20140727b
 LEAFNODE2_SOURCE = leafnode-$(LEAFNODE2_VERSION).tar.bz2
-LEAFNODE2_SITE = http://home.pages.de/~mandree/leafnode/beta
+LEAFNODE2_SITE = http://www.dt.e-technik.tu-dortmund.de/~ma/leafnode/beta
 LEAFNODE2_LICENSE = LGPLv2.1
 LEAFNODE2_LICENSE_FILES = COPYING COPYING.LGPL
 LEAFNODE2_DEPENDENCIES = host-pcre pcre
-- 
1.7.10.4
