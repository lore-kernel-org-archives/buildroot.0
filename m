From: Baruch Siach <baruch@tkos.co.il>
Date: Wed,  1 Aug 2012 07:48:57 +0300
Subject: [Buildroot] [PATCH 1/3] poco: add license information
Message-ID: <5d40aa0e8f5d5dc6b863bf1a0af427a377e75989.1343796460.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/poco/poco.mk |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/poco/poco.mk b/package/poco/poco.mk
index 779487f..f74c2b1 100644
--- a/package/poco/poco.mk
+++ b/package/poco/poco.mk
@@ -6,6 +6,8 @@
 POCO_VERSION = 1.4.3p1
 POCO_SOURCE = poco-$(POCO_VERSION)-all.tar.gz
 POCO_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/poco
+POCO_LICENSE = Boost-v1.0
+POCO_LICENSE_FILES = LICENSE
 POCO_INSTALL_STAGING = YES
 
 POCO_DEPENDENCIES = zlib pcre					\
-- 
1.7.10.4
