From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 13 Mar 2013 10:15:49 +0200
Subject: [Buildroot] [PATCH 2/2] poco: bump to 1.4.6p1
In-Reply-To: <00f6f81991bf095cfd67cff42e32a4881435236b.1363162371.git.baruch@tkos.co.il>
References: <00f6f81991bf095cfd67cff42e32a4881435236b.1363162371.git.baruch@tkos.co.il>
Message-ID: <439e183cec4684ac540ea8b697cddf94ea698b5c.1363162371.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/poco/poco.mk |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/poco/poco.mk b/package/poco/poco.mk
index 942b9b2..32a026b 100644
--- a/package/poco/poco.mk
+++ b/package/poco/poco.mk
@@ -3,8 +3,8 @@
 # poco
 #
 #############################################################
-POCO_VERSION_MAJOR = 1.4.4
-POCO_VERSION = $(POCO_VERSION_MAJOR)
+POCO_VERSION_MAJOR = 1.4.6
+POCO_VERSION = $(POCO_VERSION_MAJOR)p1
 POCO_SOURCE = poco-$(POCO_VERSION)-all.tar.gz
 POCO_SITE = http://downloads.sourceforge.net/project/poco/sources/poco-$(POCO_VERSION_MAJOR)
 POCO_LICENSE = Boost-v1.0
-- 
1.7.10.4
