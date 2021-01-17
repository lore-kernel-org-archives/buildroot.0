From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 17 Jan 2021 16:54:25 +0100
Subject: [Buildroot] [PATCH 1/1] package/mongodb: add MONGODB_CPE_ID_VENDOR
Message-ID: <20210117155425.350420-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:mongodb:mongodb is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Amongodb%3Amongodb

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/mongodb/mongodb.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/mongodb/mongodb.mk b/package/mongodb/mongodb.mk
index e16bb2a169..377484a00b 100644
--- a/package/mongodb/mongodb.mk
+++ b/package/mongodb/mongodb.mk
@@ -11,6 +11,8 @@ MONGODB_SOURCE = mongodb-src-r$(MONGODB_VERSION).tar.gz
 MONGODB_LICENSE = Apache-2.0 (drivers), SSPL (database)
 MONGODB_LICENSE_FILES = APACHE-2.0.txt LICENSE-Community.txt
 
+MONGODB_CPE_ID_VENDOR = mongodb
+
 MONGODB_DEPENDENCIES = \
 	boost \
 	host-python3-cheetah \
-- 
2.29.2
