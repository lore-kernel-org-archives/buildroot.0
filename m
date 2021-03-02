From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue,  2 Mar 2021 14:37:09 +0100
Subject: [Buildroot] [PATCH 1/1] package/rabbitmq-c: set
 RABBITMQ_C_CPE_ID_VALID
Message-ID: <20210302133709.362189-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:rabbitmq-c_project:rabbitmq-c is a valid CPE identifier for
this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Arabbitmq-c_project%3Arabbitmq-c

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/rabbitmq-c/rabbitmq-c.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/rabbitmq-c/rabbitmq-c.mk b/package/rabbitmq-c/rabbitmq-c.mk
index d25673b59b..2c7d15c0ad 100644
--- a/package/rabbitmq-c/rabbitmq-c.mk
+++ b/package/rabbitmq-c/rabbitmq-c.mk
@@ -8,6 +8,7 @@ RABBITMQ_C_VERSION = 0.10.0
 RABBITMQ_C_SITE = $(call github,alanxz,rabbitmq-c,v$(RABBITMQ_C_VERSION))
 RABBITMQ_C_LICENSE = MIT
 RABBITMQ_C_LICENSE_FILES = LICENSE-MIT
+RABBITMQ_C_CPE_ID_VALID = YES
 RABBITMQ_C_INSTALL_STAGING = YES
 RABBITMQ_C_CONF_OPTS = \
 	-DBUILD_API_DOCS=OFF \
-- 
2.30.0
