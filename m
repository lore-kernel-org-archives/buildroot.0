From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Wed, 19 May 2021 08:00:54 +0200
Subject: [Buildroot] [PATCH 1/1] package/bird: add BIRD_CPE_ID_VENDOR
Message-ID: <20210519060054.1586885-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:nic:bird is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Anic%3Abird

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/bird/bird.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/bird/bird.mk b/package/bird/bird.mk
index 6b28102754..b711e7de01 100644
--- a/package/bird/bird.mk
+++ b/package/bird/bird.mk
@@ -8,6 +8,7 @@ BIRD_VERSION = 2.0.7
 BIRD_SITE = ftp://bird.network.cz/pub/bird
 BIRD_LICENSE = GPL-2.0+
 BIRD_LICENSE_FILES = README
+BIRD_CPE_ID_VENDOR = nic
 BIRD_DEPENDENCIES = host-flex host-bison
 
 ifeq ($(BR2_PACKAGE_BIRD_CLIENT),y)
-- 
2.30.2
