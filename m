From: =?UTF-8?q?Stefan=20Fr=C3=B6berg?= <stefan.froberg@petroprogram.com>
Date: Tue, 15 Jan 2013 14:51:26 +0200
Subject: [Buildroot] [PATCH] proxychains: bump to version 4.4
Message-ID: <1358254286-5057-1-git-send-email-stefan.froberg@petroprogram.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Stefan Fr?berg <stefan.froberg@petroprogram.com>
---
 package/proxychains/proxychains.mk |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/proxychains/proxychains.mk b/package/proxychains/proxychains.mk
index 7c4500d..5e68ce4 100644
--- a/package/proxychains/proxychains.mk
+++ b/package/proxychains/proxychains.mk
@@ -3,8 +3,8 @@
 # ProxyChains
 #
 #############################################################
-PROXYCHAINS_VERSION = 3.1
-PROXYCHAINS_SOURCE = proxychains-$(PROXYCHAINS_VERSION).tar.gz
-PROXYCHAINS_SITE = http://downloads.sourceforge.net/project/proxychains/proxychains/version%20$(PROXYCHAINS_VERSION)
+PROXYCHAINS_VERSION = 4.4
+PROXYCHAINS_SOURCE = proxychains-$(PROXYCHAINS_VERSION).tar.bz2
+PROXYCHAINS_SITE = http://codu.org/~rofl/tarballs
 
 $(eval $(autotools-package))
-- 
1.7.7.6
