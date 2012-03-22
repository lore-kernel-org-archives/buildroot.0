From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 22 Mar 2012 07:13:36 +0200
Subject: [Buildroot] [PATCH] poco: bump to 1.4.3p1
Message-ID: <b3e3a7e7b9f13aee1c73bfe52d561367370496d5.1332393153.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/poco/poco.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/poco/poco.mk b/package/poco/poco.mk
index 5d07972..ddb5b25 100644
--- a/package/poco/poco.mk
+++ b/package/poco/poco.mk
@@ -3,7 +3,7 @@
 # poco
 #
 #############################################################
-POCO_VERSION = 1.4.2p1
+POCO_VERSION = 1.4.3p1
 POCO_SOURCE = poco-$(POCO_VERSION)-all.tar.gz
 POCO_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/poco
 POCO_INSTALL_STAGING = YES
-- 
1.7.9.1
