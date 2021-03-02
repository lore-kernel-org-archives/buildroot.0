From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 2 Mar 2021 21:37:40 +0100
Subject: [Buildroot] [git commit] package/rabbitmq-c: set
 RABBITMQ_C_CPE_ID_VALID
Message-ID: <20210302201929.B0424819E6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d94ac06d0d3ecdb773a7872e8108d1820c10dd33
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:rabbitmq-c_project:rabbitmq-c is a valid CPE identifier for
this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Arabbitmq-c_project%3Arabbitmq-c

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
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
